import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scaler/features/jobs/bloc/job_bloc.dart';
import 'package:scaler/features/jobs/models/job_post.dart';
import 'package:scaler/features/jobs/screens/job_info.dart';
import 'package:scaler/features/jobs/widgets/custom_image.dart';
import 'package:scaler/features/jobs/widgets/error_box.dart';
import 'package:scaler/features/jobs/widgets/notification_bell.dart';
import 'package:scaler/features/shimmers/job_post_box_shimmer.dart';

part '../part/jobs_tile.dart';
part '../part/jobs_list_builder.dart';

/// A tab widget for displaying job listings.
class JobsTab extends StatefulWidget {
  /// Creates a [JobsTab] widget.
  const JobsTab({super.key});

  @override
  State<JobsTab> createState() => _JobsTabState();
}

class _JobsTabState extends State<JobsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: .1,
        shadowColor: const Color(0xFFF8F6F8),
        title: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Text(
            'Jobs',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        actions: const [NotificationBell()],
      ),
      body: BlocBuilder<JobBloc, JobState>(
        builder: (context, state) {
          if (state.status == Status.loading ||
              state.status == Status.initial) {
            return const JobPostBoxShimmer();
          }
          if (state.status == Status.failed) {
            return ErrorBox(state.error.message);
          }
          if (state.status == Status.success && state.jobsList.isEmpty) {
            return const ErrorBox('No Jobs Found.');
          }
          return const _JobsListBuilder();
        },
      ),
    );
  }
}
