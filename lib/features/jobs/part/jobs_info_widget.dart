part of '../screens/job_info.dart';

class _JobInfoWidget extends StatelessWidget {
  const _JobInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: BlocBuilder<JobBloc, JobState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _CompanyInfo(),
                  SizedBox(height: 24.h),
                  Text(
                    state.jobDetails!.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    '${state.jobDetails!.location} . ${state.jobDetails!.workPreference} . ${state.jobDetails!.type}',
                    style: TextStyle(
                      color: const Color(0xff535054),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  const _TagsBuilder(),
                  SizedBox(height: 24.h),
                  Text(
                    'Job Description',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    state.jobDetails!.jobDescription,
                    style: TextStyle(
                      color: const Color(0xff423F43),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Key Responsibilities',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  const _ResponsiblitiesBuilder(),
                ],
              );
            },
          ),
        ),
        const _ApplyButton(),
      ],
    );
  }
}
