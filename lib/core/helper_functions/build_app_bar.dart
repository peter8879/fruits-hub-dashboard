import 'package:flutter/material.dart';

AppBar buildAppBar({required String title}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
    ),
  );
}