import 'package:flutter/material.dart';

class SearchController {
  final TextEditingController controller;

  SearchController() : controller = TextEditingController();

  void dispose() {
    controller.dispose();
  }
}
