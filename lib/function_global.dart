
import 'package:flutter/material.dart';

String getnameshort(String name){

  String nameshort=name.length>15?
  '..'+ name.substring(0, 15).toString():
  name.toString();
  return nameshort;
}String getnamelong(String name){

  String nameshort=name.length>30?
  '..'+ name.substring(0, 30).toString():
  name.toString();
  return nameshort;
}