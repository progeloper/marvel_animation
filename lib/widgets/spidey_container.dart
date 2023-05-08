import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marvel_animation/screens/spidey_screen.dart';

class SpideyContainer extends StatefulWidget {
  const SpideyContainer({Key? key}) : super(key: key);

  @override
  State<SpideyContainer> createState() => _SpideyContainerState();
}

class _SpideyContainerState extends State<SpideyContainer> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Stack(
          children: [
            GestureDetector(
              onPanUpdate: (swipe){
                if(swipe.delta.dy > 0){

                }
              },
              child: Container(
                height: 800,
                width: 350,
                margin: EdgeInsets.zero,
                padding: const EdgeInsets.only(
                    left: 16, right: 16, bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent[400],
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
                        'Spider-Man',
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
                        'Peter Parker',
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
                        'Bitten by a radioactive spider, Peter Parker\'s arachnid abilities give him amazing powers he uses to help others, while his personal life continues to offer plenty of obstacles.',
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
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SpideyScreen()));
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_up,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -120,
              left: 40,
              child: Hero(
                tag: 'icon',
                child: SvgPicture.asset(
                  'assets/icons/spiderman-icon.svg',
                  color: Colors.white,
                  width: 290,
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: -125,
          left: 80,
          child: Hero(
            tag: 'spidey',
            child: Image.asset(
              'assets/images/spiderman-body.png',
              height: 250,
            ),
          ),
        ),
      ],
    );
  }
}
