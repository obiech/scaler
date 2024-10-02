import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scaler/core/extension/shimmer.dart';
import 'package:scaler/features/shimmers/shimmer_box.dart';

class JobPostBoxShimmer extends StatefulWidget {
  const JobPostBoxShimmer({super.key});

  @override
  State<JobPostBoxShimmer> createState() => _JobPostBoxShimmerState();
}

class _JobPostBoxShimmerState extends State<JobPostBoxShimmer> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: 3,
      padding: EdgeInsets.all(16.h),
      separatorBuilder: (context, index) {
        return SizedBox(height: 16.h);
      },
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            height: 125.h,
            padding: EdgeInsets.all(16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: const Color(0xffF8F6F8)),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerBox(
                        height: 54.h,
                        width: 54.h,
                      ),
                      SizedBox(width: 14.w),
                      SizedBox(
                        height: 60.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ShimmerBox(
                              height: 18.h,
                              width: 200.h,
                            ),
                            ShimmerBox(
                              height: 14.h,
                              width: 80.h,
                            ),
                            ShimmerBox(
                              height: 14.h,
                              width: 140.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ShimmerBox(
                    height: 14.h,
                    width: 50.h,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ).shimmer();
  }
}
