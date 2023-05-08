import 'package:flutter/material.dart';

class NewsBox extends StatelessWidget {
  final String asset;
  const NewsBox({Key? key, required this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 140,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Image.asset(asset),
      ),
    );
  }
}
