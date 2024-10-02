part of '../screens/job_info.dart';

class _ApplyButton extends StatelessWidget {
  const _ApplyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 44.h,
        margin: EdgeInsets.all(16.r),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xff6C2F80),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          'Apply',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
