import 'package:flutter/material.dart';

import '../models/feature_item.dart';
import '../models/info_item.dart';
import '../models/student_profile.dart';
import '../routes/app_routes.dart';

class DummyData {
  static const campusGlimpseItems = [
    (
      'Student Activity',
      'https://images.pexels.com/photos/159775/library-la-trobe-study-students-159775.jpeg',
    ),
    (
      'Central Library',
      'https://images.unsplash.com/photo-1521587760476-6c12a4b040da?w=1200',
    ),
    (
      'Main Building',
      'https://images.unsplash.com/photo-1562774053-701939374585?w=1200',
    ),
    (
      'Innovation Lab',
      'https://images.unsplash.com/photo-1581090464777-f3220bbe1b8b?w=1200',
    ),
    (
      'Seminar Hall',
      'https://images.unsplash.com/photo-1517048676732-d65bc937f952?w=1200',
    ),
    (
      'Sports Arena',
      'https://images.unsplash.com/photo-1546519638-68e109498ffc?w=1200',
    ),
    (
      'Campus Garden',
      'https://images.unsplash.com/photo-1509062522246-3755977927d7?w=1200',
    ),
  ];

  static const academicsItems = [
    FeatureItem(
      title: 'Academic Calendar',
      subtitle: 'Key dates for semester, exams, holidays, and activities.',
      icon: Icons.calendar_month_rounded,
      routeName: AppRoutes.academicCalendar,
      illustrationAsset: 'assets/illustrations/academic_calendar.svg',
    ),
    FeatureItem(
      title: 'Timetable',
      subtitle: 'Daily lecture and lab schedule for your class.',
      icon: Icons.schedule_rounded,
      routeName: AppRoutes.timetable,
      illustrationAsset: 'assets/illustrations/timetable.svg',
    ),
    FeatureItem(
      title: 'Assignments',
      subtitle: 'Upcoming submissions and status tracking.',
      icon: Icons.assignment_rounded,
      routeName: AppRoutes.assignments,
      illustrationAsset: 'assets/illustrations/academic_calendar.svg',
    ),
    FeatureItem(
      title: 'Exam Planner',
      subtitle: 'Internal and end-sem exam preparation plan.',
      icon: Icons.fact_check_rounded,
      routeName: AppRoutes.examPlanner,
      illustrationAsset: 'assets/illustrations/timetable.svg',
    ),
  ];

  static const noticeItems = [
    FeatureItem(
      title: 'Notifications',
      subtitle: 'Department alerts and announcement feed.',
      icon: Icons.notifications_active_rounded,
      routeName: AppRoutes.notifications,
      illustrationAsset: 'assets/illustrations/notifications.svg',
    ),
    FeatureItem(
      title: 'Circulars',
      subtitle: 'Official college and department circulars.',
      icon: Icons.campaign_rounded,
      routeName: AppRoutes.circulars,
      illustrationAsset: 'assets/illustrations/notifications.svg',
    ),
    FeatureItem(
      title: 'Placement Updates',
      subtitle: 'Drive schedules, rounds, and prep sessions.',
      icon: Icons.work_history_rounded,
      routeName: AppRoutes.placements,
      illustrationAsset: 'assets/illustrations/profile.svg',
    ),
    FeatureItem(
      title: 'Events',
      subtitle: 'Workshops, hackathons, and guest lectures.',
      icon: Icons.event_available_rounded,
      routeName: AppRoutes.events,
      illustrationAsset: 'assets/illustrations/profile.svg',
    ),
  ];

  static const List<InfoItem> academicCalendar = [
    InfoItem(
      title: 'Course Registration Closes',
      subtitle: 'Last date to register courses for semester',
      date: 'Mar 4, 2026',
      details:
          'All students must complete course registration through the portal by the end of day. Late registrations will not be accepted and require dean approval.',
    ),
    InfoItem(
      title: 'Open Source Sprint',
      subtitle: 'Campus-wide contribution sprint',
      date: 'Mar 16, 2026',
      details:
          'Participate in mentoring sessions and hands-on contribution to open-source projects. Bring laptops and prior setup as described on the event page.',
    ),
    InfoItem(
      title: 'Tech Symposium 2026',
      subtitle: 'Annual technical symposium',
      date: 'Apr 5, 2026',
      details:
          'Talks, paper presentations, and workshops across AI, Cloud, and Web technologies. Registration required for presenters.',
    ),
  ];

  static const List<InfoItem> timetable = [
    InfoItem(
      title: 'Monday Schedule',
      subtitle: 'DSA, DBMS Lab, OS',
      date: 'Weekly - Monday',
      details:
          '09:00 - DSA (Theory)\n11:00 - DBMS Lab (Lab)\n14:00 - Operating Systems (Lecture)\nMake sure to check lab groups.',
    ),
    InfoItem(
      title: 'Tuesday Schedule',
      subtitle: 'TOC, Web Tech, Mini Project',
      date: 'Weekly - Tuesday',
      details:
          '09:00 - TOC\n11:00 - Web Technology\n14:00 - Mini Project guidance',
    ),
  ];

  static const List<InfoItem> assignments = [
    InfoItem(
      title: 'DSA: Graphs Assignment',
      subtitle: 'Shortest path implementations',
      date: 'Due Mar 8, 2026',
      details:
          'Implement Dijkstra and Bellman-Ford for weighted graphs. Include complexity analysis and test cases.',
    ),
    InfoItem(
      title: 'DBMS: SQL Optimization',
      subtitle: 'Optimization worksheet',
      date: 'Due Mar 10, 2026',
      details:
          'Optimize given queries, provide indices suggestions and explain cost differences.',
    ),
  ];

  static const List<InfoItem> examPlanner = [
    InfoItem(
      title: 'Week 1: Unit-wise Revision',
      subtitle: 'Focus on Unit 1 and summaries',
      date: 'Week 1',
      details:
          'Prepare concise formula sheets and revise lecture notes. Attend revision session on Friday.',
    ),
  ];

  static const List<InfoItem> notifications = [
    InfoItem(
      title: 'Attendance Portal Maintenance',
      subtitle: 'Portal downtime scheduled',
      date: 'Sunday, Mar 7, 2026',
      details:
          'The attendance portal will be unavailable from 1:00 AM to 5:00 AM for maintenance. Plan submissions accordingly.',
    ),
    InfoItem(
      title: 'Library Hours Extended',
      subtitle: 'Weekday extension to 9 PM',
      date: 'Mar 1, 2026',
      details:
          'Library now open till 9:00 PM on weekdays until the end of semester for study sessions.',
    ),
  ];

  static const List<InfoItem> circulars = [
    InfoItem(
      title: 'Anti-ragging Affidavit',
      subtitle: 'Reminder to submit affidavits',
      date: 'Ongoing',
      details:
          'All new students must submit the anti-ragging affidavit at the admin office or via the online form before the deadline.',
    ),
  ];

  static const List<InfoItem> placements = [
    InfoItem(
      title: 'Infosys Mock Drive',
      subtitle: 'Campus mock placement',
      date: 'Mar 12, 2026',
      details:
          'Mock drive conducted by Infosys recruitment team. Register on the placements portal. Bring 2 copies of your resume.',
    ),
  ];

  static const List<InfoItem> events = [
    InfoItem(
      title: 'Tech Symposium 2026',
      subtitle: 'Annual symposium',
      date: 'Apr 5, 2026',
      details: 'Talks, workshops and competitions. Submit abstracts by Mar 20.',
    ),
  ];

  static const studentProfile = StudentProfile(
    name: 'Mayur Hedau',
    rollNo: '2025510023',
    semester: 'Semester II',
    branch: 'Master of Computer Applications',
    email: 'mayur.hedau25@spit.ac.in',
    phone: '+91 98765 43210',
    photoUrl:
        'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=400',
  );
}
