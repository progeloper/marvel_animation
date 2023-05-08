import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StarkContainer extends StatefulWidget {
  const StarkContainer({Key? key}) : super(key: key);

  @override
  State<StarkContainer> createState() => _StarkContainerState();
}

class _StarkContainerState extends State<StarkContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Stack(
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
                  color: Colors.yellow[900],
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
                        'Iron-Man',
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
                        'Tony Stark',
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
                        'Genius, Billionaire, Playboy, Philanthropist. Tony Stark\'s confidence is only matched by his high-flying abilities as Iron-Man.',
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
                top: -110,
                left: 30,
                child: SvgPicture.asset(
                  'assets/icons/iron-man-icon.svg',
                  color: Colors.white,
                  width: 290,
                ),
              ),
            ],
          ),
          Positioned(
            top: -140,
            left: 40,
            child: Hero(
              tag: 'ironman',
              child: Image.asset(
                'assets/images/iron-man-body.png',
                height: 270,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
