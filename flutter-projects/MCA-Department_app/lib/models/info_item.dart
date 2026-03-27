class InfoItem {
  final String title;
  final String subtitle;
  final String date; // human readable date or time
  final String details; // longer description / more info
  final String? location;
  final String? link;

  const InfoItem({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.details,
    this.location,
    this.link,
  });
}
