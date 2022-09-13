import 'package:flutter/material.dart';

var clrBlack = Color(0xff06161C);
var clrGrey = Color(0xff979899);
var clrWhite000 = Color(0xffffffff);
var clrWhite100 = Color(0xffF3F5F7);
var clrPrimary = Color(0xff23AA49);
var clrSecondary = Color(0xffFF324B);

myfont(double? size, [FontWeight? fw, Color? clr]) {
  return TextStyle(
    fontSize: size,
    fontWeight: fw,
    color: clr,
  );
}
