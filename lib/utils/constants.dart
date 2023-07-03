// ignore_for_file: constant_identifier_names
import 'package:flutter/material.dart';

//url api

const String API_URL = 'https://fakestoreapi.com/products';

//handling error

const INVALID_RESPONSE = 100;
const NO_INTERNET = 101;
const INVALID_FORMAT = 102;
const UNKNOWN_ERROR = 103;

//colors

class AppColors {
  static const Color primaryColor = Color(0xFF022238);
  static const Color white = Colors.white;
  static const Color grey = Colors.grey;
  static const Color addButton = Color(0xFF1D1D1F);
  static const Color modalColor = Color(0xFF843667);
  static const Color starColor = Color(0xFFFFC807);
  static const Color notificationColor = Colors.red;
}

int notificationCount = 2;
