import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../data/dummy_data.dart';

class UseWebViewScreen extends StatefulWidget {
  const UseWebViewScreen({super.key});

  @override
  State<UseWebViewScreen> createState() => _UseWebViewScreenState();
}

class _UseWebViewScreenState extends State<UseWebViewScreen> {
  late final WebViewController _controller;
  final TextEditingController _inputController = TextEditingController(
    text: 'https://flutter.dev',
  );
  double _progress = 0;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) =>
              setState(() => _progress = progress / 100.0),
        ),
      )
      ..loadRequest(Uri.parse(_inputController.text));
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  void _loadUrl() {
    final raw = _inputController.text.trim();
    if (raw.isEmpty) return;
    final uri = Uri.tryParse(raw);
    if (uri == null || (!uri.hasScheme)) {
      // If no scheme, assume https
      _controller.loadRequest(Uri.parse('https://$raw'));
    } else {
      _controller.loadRequest(uri);
    }
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Use WebView'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => _controller.reload(),
          ),
          PopupMenuButton<String>(
            onSelected: (value) async {
              if (value == 'email') {
                final mail = Uri(
                  scheme: 'mailto',
                  path: DummyData.studentProfile.email,
                  queryParameters: {'subject': 'Inquiry from SPIT App'},
                );
                final messenger = ScaffoldMessenger.of(context);
                final launched = await launchUrl(
                  mail,
                  mode: LaunchMode.externalApplication,
                );
                if (!launched) {
                  messenger.showSnackBar(
                    const SnackBar(
                      content: Text('Unable to open email client.'),
                    ),
                  );
                }
              } else if (value == 'instagram') {
                _controller.loadRequest(
                  Uri.parse('https://www.instagram.com/'),
                );
              } else if (value == 'website') {
                _controller.loadRequest(Uri.parse('https://www.spit.ac.in/'));
              }
            },
            itemBuilder: (_) => const [
              PopupMenuItem(
                value: 'email',
                child: ListTile(
                  leading: Icon(Icons.email),
                  title: Text('Email'),
                ),
              ),
              PopupMenuItem(
                value: 'instagram',
                child: ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text('Instagram'),
                ),
              ),
              PopupMenuItem(
                value: 'website',
                child: ListTile(
                  leading: Icon(Icons.public),
                  title: Text('Visit College Website'),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _inputController,
                    decoration: const InputDecoration(
                      labelText: 'Enter URL',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.url,
                    onSubmitted: (_) => _loadUrl(),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(onPressed: _loadUrl, child: const Text('Go')),
              ],
            ),
          ),
          if (_progress < 1.0) LinearProgressIndicator(value: _progress),
          Expanded(child: WebViewWidget(controller: _controller)),
        ],
      ),
    );
  }
}
