import 'package:flutter/material.dart';

buildAppBar({String? title}) {
  return AppBar(
    title: Text(title??''),
  );
}
