import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/info_item.dart';
import '../screens/list_detail_screen.dart';
import '../screens/student_id_card_screen.dart';
import '../screens/student_profile_screen.dart';
import '../screens/attendance_analytics_screen.dart';
import '../screens/gpa_calculator_screen.dart';
import '../screens/assignment_reminder_screen.dart';
import '../screens/admin_dashboard_screen.dart';
import '../screens/export_pdf_screen.dart';

class AppRoutes {
  static const academicCalendar = '/academic-calendar';
  static const timetable = '/timetable';
  static const assignments = '/assignments';
  static const examPlanner = '/exam-planner';
  static const notifications = '/notifications';
  static const circulars = '/circulars';
  static const placements = '/placements';
  static const events = '/events';
  static const studentProfile = '/student-profile';
  static const studentIdCard = '/student-id-card';
  static const attendanceAnalytics = '/attendance-analytics';
  static const gpaCalculator = '/gpa-calculator';
  static const assignmentReminders = '/assignment-reminders';
  static const exportPdf = '/export-pdf';
  static const adminDashboard = '/admin-dashboard';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case academicCalendar:
        return _listRoute('Academic Calendar', DummyData.academicCalendar);
      case timetable:
        return _listRoute('Timetable', DummyData.timetable);
      case assignments:
        return _listRoute('Assignments', DummyData.assignments);
      case examPlanner:
        return _listRoute('Exam Planner', DummyData.examPlanner);
      case notifications:
        return _listRoute('Notifications', DummyData.notifications);
      case circulars:
        return _listRoute('Circulars', DummyData.circulars);
      case placements:
        return _listRoute('Placement Updates', DummyData.placements);
      case events:
        return _listRoute('Events', DummyData.events);
      case studentProfile:
        return MaterialPageRoute(builder: (_) => const StudentProfileScreen());
      case studentIdCard:
        return MaterialPageRoute(builder: (_) => const StudentIdCardScreen());
      case attendanceAnalytics:
        return MaterialPageRoute(
          builder: (_) => const AttendanceAnalyticsScreen(),
        );
      case gpaCalculator:
        return MaterialPageRoute(builder: (_) => const GpaCalculatorScreen());
      case assignmentReminders:
        return MaterialPageRoute(
          builder: (_) => const AssignmentReminderScreen(),
        );
      case exportPdf:
        return MaterialPageRoute(builder: (_) => const ExportPdfScreen());
      case adminDashboard:
        return MaterialPageRoute(builder: (_) => const AdminDashboardScreen());
      default:
        return null;
    }
  }

  static Route<dynamic> _listRoute(String title, List<InfoItem> points) {
    return MaterialPageRoute(
      builder: (_) => ListDetailScreen(title: title, points: points),
    );
  }
}
