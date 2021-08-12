import 'package:flutter/material.dart';
import 'package:my_app/Screens/Home/item_list.dart';

class ImageSliderDots extends StatefulWidget {
  final currentPage;
  ImageSliderDots({@required this.currentPage});
  @override
  _ImageSliderDotsState createState() => _ImageSliderDotsState();
}

class _ImageSliderDotsState extends State<ImageSliderDots> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(4, (int index) {
          return Container(
            margin: EdgeInsets.all(2),
            height: 10,
            width: 10,
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: widget.currentPage == index ?  Colors.white : Colors.grey),
          );
        }),
      ),
    );
  }
}
