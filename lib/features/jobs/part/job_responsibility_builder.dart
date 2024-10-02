part of '../screens/job_info.dart';

class _ResponsiblitiesBuilder extends StatelessWidget {
  const _ResponsiblitiesBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobBloc, JobState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.jobDetails!.requirements.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Text(
              '- ${state.jobDetails!.requirements[index]}',
              style: TextStyle(
                color: const Color(0xff423F43),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
              ),
            );
          },
        );
      },
    );
  }
}
