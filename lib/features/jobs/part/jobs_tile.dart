part of '../screens/job_listing.dart';

class _JobTile extends StatelessWidget {
  const _JobTile({
    super.key,
    required this.job,
  });
  final JobPost job;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      // height: 125.h,
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: const Color(0xffF8F6F8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImage(
                image: job.logo,
                size: 54,
              ),
              SizedBox(width: 14.w),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job.jobTitle,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      job.companyName,
                      style: TextStyle(
                        color: const Color(0xff737074),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '${job.location} . ${job.workplacePreference} . ${job.type}',
                      style: TextStyle(
                        color: const Color(0xff737074),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              timeAgo(job.createdAt),
              style: TextStyle(
                color: const Color(0xffA09DA1),
                fontSize: 11.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
