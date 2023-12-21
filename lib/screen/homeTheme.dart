import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:learnverse/widgets/listViewHome.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  // CarouselController buttonCarouselController = CarouselController();
  final controller = PageController(viewportFraction: 0.7, keepPage: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(117, 123, 200, 1),
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 160,
                    height: 60,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 255, 255, 255)),
                        color: const Color.fromARGB(0, 155, 39, 176),
                        borderRadius: BorderRadius.circular(38)),
                    child: const Row(children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          minRadius: 25,
                          maxRadius: 25,
                          backgroundColor: Color.fromRGBO(203, 178, 254, 1),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        'Search',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w400),
                      )
                    ]),
                  ),
                  const SizedBox(
                    child: CircleAvatar(
                      minRadius: 30,
                      maxRadius: 30,
                    ),
                  )
                ],
              ),
              // CarouselSlider.builder(
              //     carouselController: buttonCarouselController,
              //     itemCount: 10,
              //     itemBuilder:
              //         (BuildContext context, int index, int pageViewIndex) {
              //       return Container(
              //         width: 310,
              //         color: const Color.fromARGB(255, 118, 69, 69),
              //       );
              //     },
              //     options: CarouselOptions(height: 400)),
              SizedBox(
                height: 400,
                child: PageView.builder(
                    controller: controller,
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return const ThemeChooseHome();
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              SmoothPageIndicator(
                  controller: controller, // PageController
                  count: 10,
                  textDirection: TextDirection.ltr,
                  effect: const ScrollingDotsEffect(
                    fixedCenter: true,
                    dotColor: Colors.white,
                    maxVisibleDots: 7,
                    spacing: 12,
                  ), // your preferred effect
                  onDotClicked: (index) {})
            ],
          ),
        ));
  }
}
