import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scaler/features/jobs/screens/job_listing.dart';
import 'package:scaler/features/resume/resume_tab.dart';
import 'package:scaler/features/settings/settings_tab.dart';
import 'package:scaler/scaler.dart';

/// The main application widget that serves as the entry point for the app.
/// It initializes the app with necessary configurations such as the
/// screen size for responsiveness, theme settings, and routing.
/// The app uses Material Design 3 and a custom font for styling.
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 824),
      builder: (context, child) {
        return MaterialApp(
          title: 'Scaler',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            fontFamily: 'IBMPlexSansArabic',
          ),
          routes: {
            '/': (context) => const ScalerScreen(),
            '/JobsTab': (context) => const JobsTab(),
            '/SettingsTab': (context) => const SettingsTab(),
            '/ResumeTab': (context) => const ResumeTab(),
          },
          initialRoute: '/',
        );
      },
    );
  }
}
