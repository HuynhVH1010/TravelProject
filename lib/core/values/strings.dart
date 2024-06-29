import 'dart:ui';

import 'package:flutter/material.dart';

const kPadding = 20.0;
const kPageSize = 50;
const kDefaultDuration = Duration(milliseconds: 250);
const kCardHeight = 200.0;
const kMaxWidth = 1250.0;
const kButtonHeight = 54.0;
//
final kFirstDay = DateTime(DateTime.now().year, DateTime.now().month - 3, DateTime.now().day);
final kLastDay = DateTime(DateTime.now().year, DateTime.now().month + 3, DateTime.now().day);
//
final RegExp kEmailValidatorRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final RegExp kPhoneValidatorRegExp = RegExp(r"(^(?:[+0]9)?[0-9]{10,12}$)");
final RegExp kUrlRegExp = RegExp(r"((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?");
final RegExp kHashTagRegExp = RegExp(r"\#(\w+)");
//
final TextStyle kTextStyleThin = kTextStyleNormal.copyWith(
  fontWeight: FontWeight.w100,//Thin
);
final TextStyle kTextStyleExtraLight = kTextStyleNormal.copyWith(
  fontWeight: FontWeight.w200,//Extra-light
);
final TextStyle kTextStyleLight = kTextStyleNormal.copyWith(
  fontWeight: FontWeight.w300,//light
);
final TextStyle kTextStyleNormal = TextStyle(
  fontSize: 17,
  fontWeight: FontWeight.w400,//normal
  fontFamily: 'Roboto',
);
final TextStyle kTextStyleMedium = kTextStyleNormal.copyWith(
  fontWeight: FontWeight.w500,//medium
);
final TextStyle kTextStyleSemiBold = kTextStyleNormal.copyWith(
  fontWeight: FontWeight.w600,//SemiBold
);
final TextStyle kTextStyleBold = kTextStyleNormal.copyWith(
  fontWeight: FontWeight.w700,//Bold
);