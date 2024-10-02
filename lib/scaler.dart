import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scaler/core/models/bottom_nav_bar_item.dart';
import 'package:scaler/features/jobs/screens/job_listing.dart';
import 'package:scaler/features/resume/resume_tab.dart';
import 'package:scaler/features/settings/settings_tab.dart';
import 'package:scaler/features/widgets/nav_bar.dart';

/// The main screen of the Scaler application.
///
/// This screen utilizes a bottom navigation bar to switch between different tabs:
/// Jobs, Resume, and Settings. Each tab is implemented using a separate Navigator,
/// allowing for independent navigation stacks within each tab. The selected tab's
/// index is managed with a state variable, ensuring the correct tab is displayed
/// to the user.
class ScalerScreen extends StatefulWidget {
  const ScalerScreen({super.key});

  @override
  State<ScalerScreen> createState() => _ScalerScreenState();
}

class _ScalerScreenState extends State<ScalerScreen> {
  int _currentIndex = 0;

  final _page1 = GlobalKey<NavigatorState>();
  final _page2 = GlobalKey<NavigatorState>();
  final _page3 = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: <Widget>[
          Navigator(
            key: _page1,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => const JobsTab(),
            ),
          ),
          Navigator(
            key: _page2,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => const SettingsTab(),
            ),
          ),
          Navigator(
            key: _page3,
            onGenerateRoute: (route) => MaterialPageRoute(
              settings: route,
              builder: (context) => const ResumeTab(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomBarApp(
        onTabSelected: (index) {
          setState(() => _currentIndex = index);
        },
        selectedIndex: _currentIndex,
        color: const Color(0xff313546).withOpacity(.5),
        selectedColor: const Color(0xff313546),
        height: 90.h,
        iconSize: 24.r,
        width: 124.w,
        items: const [
          BottomBarAppItem(
            icon: 'assets/briefcase-01.svg',
            text: 'Jobs',
          ),
          BottomBarAppItem(
            icon: 'assets/user-02.svg',
            text: 'Resume',
          ),
          BottomBarAppItem(
            icon: 'assets/settings-02.svg',
            text: 'Settings',
          ),
        ],
      ),
    );
  }
}
