import 'package:flutter/material.dart';

import 'image_slider_dots.dart';

class ImageSlider extends ChangeNotifier {
  int currentPage;
  Widget getDotsWidget(currPage) {
    if(currentPage == null){
      currentPage = 0;
    }else{currentPage = currPage;}
    return ImageSliderDots(
      currentPage: currentPage,
    );
  }

  actualPage(pageNumber) {
    currentPage = pageNumber;
    notifyListeners();
  }
}
