part of '../screens/job_info.dart';

class _TagsBuilder extends StatelessWidget {
  const _TagsBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JobBloc, JobState>(
      builder: (context, state) {
        return SizedBox(
          height: 26.h,
          child: ListView.separated(
            itemCount: state.jobDetails!.tags.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 11.w),
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                decoration: BoxDecoration(
                  color: const Color(0xffF0EAF2),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text(
                  state.jobDetails!.tags[index],
                  style: TextStyle(
                    color: const Color(0xff6C2F80),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
