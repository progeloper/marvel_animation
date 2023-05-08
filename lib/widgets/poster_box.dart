import 'package:flutter/material.dart';

class PosterBox extends StatelessWidget {
  final String asset;
  const PosterBox({Key? key, required this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 120,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Image.asset(asset),
      ),
    );
  }
}
