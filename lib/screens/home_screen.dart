import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:marvel_animation/constants/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _focusedIndex = 0;
  late PageController _pageController;

  void _onItemFocused(int index) {
    setState(() {
      _focusedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _focusedIndex,
      keepPage: false,
      viewportFraction: 0.5,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  builder(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 1.0;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page! - index;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
        }

        return Center(
          child: SizedBox(
            height: Curves.easeOut.transform(value) * 300,
            width: Curves.easeOut.transform(value) * 250,
            child: child,
          ),
        );
      },
      child: Constants.widgets[index],
      // Container(
      //   margin: const EdgeInsets.all(8.0),
      //   color: index % 2 == 0 ? Colors.blue : Colors.red,
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Hero(
          tag: 'arrow',
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0).copyWith(bottom: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'MARVEL',
                  style: TextStyle(
                    fontSize: 64,
                    color: Colors.black,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Super heroes',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'NotoSansJP',
                    color: Colors.grey[700],
                  ),
                ),
              ),
              // const SizedBox(
              //   height: 130,
              // ),
              Expanded(flex: 1, child: Container()),
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.bottomCenter,
                  child: CarouselSlider(
                    items: Constants.widgets,
                    options: CarouselOptions(
                      height: 800,
                      clipBehavior: Clip.none,
                      viewportFraction: 0.8,
                      initialPage: _focusedIndex,
                      autoPlay: false,
                      reverse: true,
                      scrollDirection: Axis.horizontal,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.4,
                    ),
                  ),
                  // PageView.builder(
                  //   itemCount: 3,
                  //   controller: _pageController,
                  //   onPageChanged: (value){
                  //     setState(() {
                  //       _focusedIndex = value;
                  //     });
                  //   },
                  //   itemBuilder: (context, index)=>builder(index),
                  // ),
                  // ScrollSnapList(
                  //   dynamicItemSize: true,
                  //   clipBehavior: Clip.none,
                  //   itemBuilder: (context, index) {
                  //     return Constants.widgets[index];
                  //   },
                  //   itemCount: 3,
                  //   onItemFocus: _onItemFocused, itemSize: 300,
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
