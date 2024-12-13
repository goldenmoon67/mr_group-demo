import 'dart:math';
import 'package:flutter/material.dart';

class RandomIconGenerator {
  static const List<IconData> _iconList = [
    Icons.home,
    Icons.star,
    Icons.favorite,
    Icons.settings,
    Icons.access_alarm,
    Icons.phone,
    Icons.email,
    Icons.camera,
    Icons.map,
    Icons.shopping_cart,
  ];

  static IconData getRandomIcon() {
    final random = Random();
    return _iconList[random.nextInt(_iconList.length)];
  }
}
