import 'package:finance2_app/const/app_colors.dart';
import 'package:flutter/material.dart';

final onboardstyle =
    TextStyle(fontSize: 32, fontWeight: FontWeight.w600, color: Colors.black);

final buttonText =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white);

final discriptstyle = TextStyle(
    fontSize: 16,
    color: Colors.grey.withOpacity(0.5),
    fontWeight: FontWeight.w400);

final decorationsField = InputDecoration(
  filled: true,
  fillColor: primary.withOpacity(0.08),
  hintStyle: TextStyle(
    color: Colors.grey.withOpacity(0.5),
    fontWeight: FontWeight.w400,
  ),
  prefixStyle: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: Colors.grey.withOpacity(0.5)),
  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.0),
    borderSide: BorderSide.none,
  ),
);
