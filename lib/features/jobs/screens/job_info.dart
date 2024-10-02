import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scaler/features/jobs/bloc/job_bloc.dart';
import 'package:scaler/features/jobs/widgets/custom_image.dart';
import 'package:scaler/features/jobs/widgets/error_box.dart';
import 'package:scaler/features/jobs/widgets/notification_bell.dart';
import 'package:scaler/features/shimmers/jobs_info_shimmer.dart';

part '../part/apply_button.dart';
part '../part/company_info.dart';
part '../part/job_responsibility_builder.dart';
part '../part/jobs_info_widget.dart';
part '../part/tags_builder.dart';

/// A widget that displays detailed information about a specific job.
/// Ithandles the display of loading states or errors while fetching job
/// details using Bloc state management.
class JobInfo extends StatefulWidget {
  const JobInfo({super.key});

  @override
  State<JobInfo> createState() => _JobInfoState();
}

class _JobInfoState extends State<JobInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 16.r,
            color: const Color(0xff6C2F80),
          ),
        ),
        actions: const [NotificationBell()],
      ),
      body: BlocBuilder<JobBloc, JobState>(
        builder: (context, state) {
          // Handle different states of job details fetching.
          if (state.status == Status.failed) {
            // Display error message if fetching fails.
            return ErrorBox(state.error.message);
          }
          if (state.status == Status.loading || state.jobDetails == null) {
            // Display shimmer effect while loading.
            return const JobsInfoShimmer();
          }

          // Display job information widget when data is ready.
          return const _JobInfoWidget();
        },
      ),
    );
  }
}
