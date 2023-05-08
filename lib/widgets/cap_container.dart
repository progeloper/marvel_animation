import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CapContainer extends StatefulWidget {
  const CapContainer({Key? key}) : super(key: key);

  @override
  State<CapContainer> createState() => _CapContainerState();
}

class _CapContainerState extends State<CapContainer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Stack(
          children: [
            Container(
              height: 800,
              width: 350,
              margin: EdgeInsets.zero,
              padding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 16),
              decoration: BoxDecoration(
                color: Colors.indigo[900],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 200,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Captain America',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontFamily: 'NotoSansJP',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Steve Rogers',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'NotoSansJP',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Brave, Courageous, Selfless. Steve Rogers was a lab experiment during the first world war where he ended up nearly sacrificing his life. Found preserved and frozen in ice, he was revived to fight on.',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'NotoSansJP',
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.keyboard_arrow_up,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -190,
              left: 18,
              child: SvgPicture.asset(
                'assets/icons/captain-america-shield.svg',
                color: Colors.white,
                width: 320,
              ),
            ),
          ],
        ),
        Positioned(
          top: -160,
          left: 100,
          child: Hero(
            tag: 'cap',
            child: Image.asset(
              'assets/images/cap-body.png',
              height: 290,
            ),
          ),
        ),
      ],
    );
  }
}
