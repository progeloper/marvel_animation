import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marvel_animation/widgets/news_box.dart';
import 'package:marvel_animation/widgets/poster_box.dart';

import '../constants/constants.dart';

class SpideyScreen extends StatefulWidget {
  const SpideyScreen({Key? key}) : super(key: key);

  @override
  State<SpideyScreen> createState() => _SpideyScreenState();
}

class _SpideyScreenState extends State<SpideyScreen>
    with SingleTickerProviderStateMixin {
  bool isVisible = true;
  double fullContainer = 498;
  double halfContainer = 297;
  final Duration duration = Duration(microseconds: 100);
  late AnimationController _controller;
  late Animation _animation;
  late Animation _opacity;
  late Animation _offset;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _animation = Tween<double>(begin: halfContainer, end: fullContainer)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.bounceIn))
      ..addListener(() {
        setState(() {});
      });
    _opacity = Tween<double>(begin: 1.0, end: 0.0).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _offset = Tween<Offset>(begin: Offset(0,0), end: Offset(0,-203)).animate(_controller)..addListener(() {setState(() {

    });});
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void startAnimation() {
    if (isVisible) {
      isVisible = false;
      _controller.forward();
    } else {
      _controller.reverse();
      isVisible = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    double currentContainer = fullContainer;

    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent[400],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    ),
                    // const SizedBox(
                    //   width: 8,
                    // ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Stack(
                        children: [
                          Hero(
                            tag: 'icon',
                            child: SvgPicture.asset(
                              'assets/icons/spiderman-icon.svg',
                              colorFilter: const ColorFilter.mode(
                                  Colors.white, BlendMode.srcIn),
                              height: 360,
                            ),
                          ),
                          Positioned(
                            top: 60,
                            left: 90,
                            child: Hero(
                              tag: 'spidey',
                              child: Image.asset(
                                'assets/images/spiderman-body.png',
                                height: 250,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              AnimatedOpacity(
                opacity: _opacity.value,
                duration: duration,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Spider-Man',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 42,
                            fontFamily: 'NotoSansJP',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Peter Parker',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: 'NotoSansJP',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Bitten by a radioactive spider, Peter Parker\'s arachnid abilities give him amazing powers he uses to help others, while his personal life continues to offer plenty of obstacles.',
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'NotoSansJP',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Transform.translate(
                  offset: _offset.value,
                  child: AnimatedContainer(
                    width: double.infinity,
                    height: _animation.value,
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(28),
                        topRight: Radius.circular(28),
                      ),
                    ),
                    duration: duration,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Latest News',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 32,
                                  fontFamily: 'NotoSansJP',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                  onPressed: startAnimation,
                                  icon: Icon(
                                    Icons.more_horiz_outlined,
                                    color: Colors.grey[700],
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: NewsBox(asset: Constants.newsItems[index]),
                                );
                              },
                            ),
                          ),
                          const Text(
                            'Related Movies',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontFamily: 'NotoSansJP',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 240,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: PosterBox(
                                      asset: Constants.moviePosters[index]),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
