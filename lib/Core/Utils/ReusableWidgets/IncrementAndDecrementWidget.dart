import 'package:e_commerce_application/Core/Utils/Colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IncrementAndDecrementWidget extends StatefulWidget {
  IncrementAndDecrementWidget({super.key});

  int counter = 0;

  @override
  State<IncrementAndDecrementWidget> createState() =>
      _IncrementAndDecrementWidgetState();
}

class _IncrementAndDecrementWidgetState
    extends State<IncrementAndDecrementWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: MyColors.lightSeaGreen,
            borderRadius: BorderRadius.circular(10.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 5.w,
            ),
            IconButton(
              onPressed: () {
                widget.counter++;
                setState(() {});
              },
              icon: const Icon(
                Icons.add_box_outlined,
                color: MyColors.honeydew,
              ),
            ),
            SizedBox(
              width: 15.w,
            ),
            Text(
              '${widget.counter}',
              style: TextStyle(fontSize: 18.sp, color: MyColors.honeydew),
            ),
            SizedBox(
              width: 10.w,
            ),
            IconButton(
              onPressed: () {
                widget.counter--;
                setState(() {});
              },
              icon: const Icon(
                Icons.indeterminate_check_box_outlined,
                color: MyColors.honeydew,
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
          ],
        ));
  }
}
