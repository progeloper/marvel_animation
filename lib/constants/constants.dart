import 'package:flutter/material.dart';
import 'package:marvel_animation/widgets/cap_container.dart';
import 'package:marvel_animation/widgets/spidey_container.dart';
import 'package:marvel_animation/widgets/stark_container.dart';

class Constants{
  static List<Widget> widgets = [
    SpideyContainer(),
    StarkContainer(),
    CapContainer(),
    // Padding(
    //   padding: const EdgeInsets.all(16.0),
    //   child: SizedBox(
    //     width: 400,
    //   ),
    // )
  ];

  static List<String> newsItems = [
    'assets/images/poster1.jpg',
    'assets/images/poster2.jpg',
    'assets/images/poster3.jpg',
    'assets/images/poster4.jpg',
    'assets/images/poster5.jpg',
  ];

  static List<String> moviePosters = [
    'assets/images/pic1.jpg',
    'assets/images/pic2.jpg',
    'assets/images/pic3.jpg',
    'assets/images/pic4.jpg',
    'assets/images/pic5.jpg',
  ];
}