import 'package:flutter/material.dart';

ScrollController scrollController = ScrollController();
void scrollforward() {
  scrollController.animateTo(
    scrollController.offset + 89,
    duration: Duration(seconds: 1),
    curve: Curves.easeInOut,
  );
}

void scrollbackward() {
  scrollController.animateTo(
    scrollController.offset -
        89.clamp(0.0, scrollController.position.maxScrollExtent),
    duration: Duration(seconds: 1),
    curve: Curves.easeInOut,
  );
}
