import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scaler/core/models/bottom_nav_bar_item.dart';

/// A customizable bottom navigation bar widget that displays a list of items
/// with icons and text. It allows users to select different tabs, providing
/// visual feedback on the selected tab. This widget is designed to be
/// responsive with customizable heights, widths, icon sizes, and colors.
class BottomBarApp extends StatefulWidget {
  const BottomBarApp({
    super.key,
    required this.items,
    required this.height,
    required this.iconSize,
    required this.color,
    required this.selectedColor,
    required this.onTabSelected,
    this.selectedIndex = 0,
    required this.width,
  });

  final List<BottomBarAppItem>
      items; // List of items to display in the bottom bar.
  final double height; // Height of the bottom bar.
  final double iconSize; // Size of the icons.
  final Color color; // Color of unselected items.
  final Color selectedColor; // Color of the selected item.
  final ValueChanged<int> onTabSelected; // Callback when a tab is selected.
  final int selectedIndex; // Currently selected tab index.
  final double width; // Width of each tab item.

  @override
  State<StatefulWidget> createState() => BottomBarAppState();
}

class BottomBarAppState extends State<BottomBarApp> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      // color: Color(0xff313546).withOpacity(.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(widget.items.length, (int index) {
          return _TabItemBottomBar(
            item: widget.items[index],
            index: index,
            color: widget.selectedIndex == index
                ? widget.selectedColor
                : widget.color,
            isSelected: widget.selectedIndex == index,
            onPressed: (int index) => widget.onTabSelected(index),
            height: 90.h,
            width: widget.width,
          );
        }),
      ),
    );
  }
}

/// A widget representing an individual tab item in the bottom navigation bar.
/// This widget displays an icon and text, providing visual feedback based on
/// whether it is selected. It triggers an action when tapped, allowing the
/// parent widget to handle tab selection.
class _TabItemBottomBar extends StatefulWidget {
  const _TabItemBottomBar({
    super.key,
    required this.item,
    required this.index,
    required this.onPressed,
    required this.color,
    required this.height,
    required this.isSelected,
    required this.width,
  });

  final BottomBarAppItem item; // The item to be displayed in this tab.
  final int index; // The index of the item in the list.
  final ValueChanged<int>
      onPressed; // Callback function triggered when the item is tapped.
  final Color color; // Color used for the item.
  final double height; // Height of the item.
  final bool isSelected; // Indicates whether this item is currently selected.
  final double width; // Width of the item.

  @override
  State<_TabItemBottomBar> createState() => __TabItemBottomBarState();
}

class __TabItemBottomBarState extends State<_TabItemBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: const Color(0xff313546).withOpacity(.016)),
      width: widget.width,
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          widget.onPressed(widget.index);
        },
        behavior: HitTestBehavior.opaque,
        child: Column(
          children: [
            SizedBox(height: 10.h),
            SvgPicture.asset(
              widget.item.icon,
              height: 28.w,
              width: 28.w,
              fit: BoxFit.cover,
              color: widget.isSelected
                  ? widget.index == 0
                      ? null
                      : const Color(0xff6C2F80)
                  : const Color(0xff535054),
            ),
            SizedBox(height: 5.w),
            Text(
              widget.item.text,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: widget.isSelected
                        ? const Color(0xff6C2F80)
                        : const Color(0xff535054),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
