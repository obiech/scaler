// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_screenutil/flutter_screenutil.dart';

// Project imports:
import 'package:scaler/core/extension/shimmer.dart';
import 'package:scaler/features/shimmers/shimmer_box.dart';

class JobsInfoShimmer extends StatefulWidget {
  const JobsInfoShimmer({super.key});

  @override
  State<JobsInfoShimmer> createState() => _JobsInfoShimmerState();
}

class _JobsInfoShimmerState extends State<JobsInfoShimmer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 43.h,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerBox(
                      height: 43.h,
                      width: 43.h,
                    ),
                    SizedBox(width: 8.w),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ShimmerBox(
                          height: 14,
                          width: 80,
                        ),
                        ShimmerBox(
                          height: 14,
                          width: 180,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              const ShimmerBox(
                height: 14,
                width: 180,
              ),
              SizedBox(height: 5.h),
              const ShimmerBox(
                height: 14,
                width: 200,
              ),
              SizedBox(height: 12.h),
              SizedBox(
                height: 26.h,
                child: ListView.separated(
                  itemCount: 3,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => SizedBox(width: 11.w),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 80,
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      decoration: BoxDecoration(
                        color: const Color(0xffF0EAF2),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 34.h),
              const ShimmerBox(
                height: 18,
                width: 100,
              ),
              SizedBox(height: 8.h),
              const ShimmerBox(
                height: 14,
                width: 200,
              ),
              SizedBox(height: 28.h),
              const ShimmerBox(
                height: 18,
                width: 130,
              ),
              SizedBox(height: 8.h),
              ListView.separated(
                itemCount: 3,
                shrinkWrap: true,
                separatorBuilder: (context, index) => const SizedBox(height: 6),
                itemBuilder: (context, index) {
                  return const ShimmerBox(
                    height: 14,
                    width: 200,
                  );
                },
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 44.h,
            margin: EdgeInsets.all(16.r),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xff6C2F80),
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
      ],
    ).shimmer();
  }
}
