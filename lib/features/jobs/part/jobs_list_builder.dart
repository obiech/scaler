part of '../screens/job_listing.dart';

class _JobsListBuilder extends StatelessWidget {
  const _JobsListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobBloc, JobState>(
      builder: (context, state) {
        return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemCount: state.jobsList.length,
          padding: EdgeInsets.all(16.h),
          separatorBuilder: (context, index) {
            return SizedBox(height: 16.h);
          },
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                context
                    .read<JobBloc>()
                    .add(GetJobDetails(state.jobsList[index].id));

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const JobInfo(),
                  ),
                );
              },
              child: _JobTile(job: state.jobsList[index]),
            );
          },
        );
      },
    );
  }
}
