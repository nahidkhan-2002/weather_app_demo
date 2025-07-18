import 'package:flutter/material.dart';

ScrollController scrollController = ScrollController();
void scrollforward() {
  scrollController.animateTo(
    scrollController.offset + 90,
    duration: Duration(seconds: 1),
    curve: Curves.ease,
  );
}

void scrollbackward() {
  scrollController.animateTo(
    scrollController.offset -
        90.clamp(0.0, scrollController.position.maxScrollExtent),
    duration: Duration(seconds: 1),
    curve: Curves.ease,
  );
}
