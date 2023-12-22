import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Categories extends StatefulWidget {
  final String title;
  final backgroundBanner;
  const Categories({
    super.key,
    required this.title,
    required this.backgroundBanner,
  });

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  bool isLike = false;
  @override
  Widget build(BuildContext context) {
    const String svgEffectBorder =
        '''<svg xmlns="http://www.w3.org/2000/svg" width="62" height="46" viewBox="0 0 62 46" fill="none">
  <path d="M0.0715294 46L62 46C14.2824 46 1.13029 20.325 0.0715299 4.214L0.0715299 6.8909e-06C-0.0208163 1.30331 -0.0268206 2.71739 0.0715299 4.214L0.0715294 46Z" fill="#757BC8"/>
</svg>''';
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage(widget.backgroundBanner),
                    fit: BoxFit.cover,
                  )),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      height: 70,
                      width: 400,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(44),
                          color: const Color.fromRGBO(117, 123, 200, 1)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    Navigator.pop(context);
                                  });
                                },
                                icon: const FaIcon(
                                  FontAwesomeIcons.arrowLeft,
                                  size: 30,
                                  color: Colors.white,
                                )),
                            Text(
                              widget.title,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 24),
                            ),
                            const CircleAvatar(
                              backgroundColor: Color.fromRGBO(37, 46, 169, 1),
                            )
                          ]),
                    ),
                  ),
                ),
                Positioned(
                  top: 368,
                  left: 0,
                  child: SvgPicture.string(
                    svgEffectBorder,
                    height: 70,
                    width: 70,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(117, 123, 200, 1),
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(50))),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Synopsis",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            203, 178, 254, 1),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (isLike == false) {
                                              isLike = true;
                                            } else {
                                              isLike = false;
                                            }
                                          });
                                        },
                                        icon: isLike == false
                                            ? const FaIcon(
                                                FontAwesomeIcons.heart,
                                                color: Colors.white,
                                                size: 30,
                                              )
                                            : const FaIcon(
                                                FontAwesomeIcons
                                                    .heartCircleCheck,
                                                color: Colors.white,
                                                size: 30,
                                              )),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            203, 178, 254, 1),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: const FaIcon(
                                          FontAwesomeIcons.bookmark,
                                          color: Colors.white,
                                          size: 30,
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: SizedBox(
                          height: 296,
                          child: ListView(
                            children: const [
                              Text(
                                "Lorem ipsum dolor sit amet consectetur. Faucibus fringilla ac interdum diam feugiat porta pretium cursus. Pretium imperdiet eget diam commodo quis. A lacus pharetra cursus enim posuere pellentesque. Facilisis dignissim faucibus tortor vel. Sit dictum sodales eget tortor a cras. Suspendisse malesuada nam suscipit integer tortor amet commodo nisl. Lectus libero id natoque ac et ipsum purus leo. At ac sem ornare proin nec aliquam convallis sit. Ipsum augue suscipit maecenas aliquet.",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              Text('Information'),
                              Text(
                                "Lorem ipsum dolor sit amet consectetur. Faucibus fringilla ac interdum diam feugiat porta pretium cursus. Pretium imperdiet eget diam commodo quis. A lacus pharetra cursus enim posuere pellentesque. Facilisis dignissim faucibus tortor vel. Sit dictum sodales eget tortor a cras. Suspendisse malesuada nam suscipit integer tortor amet commodo nisl. Lectus libero id natoque ac et ipsum purus leo. At ac sem ornare proin nec aliquam convallis sit. Ipsum augue suscipit maecenas aliquet.",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        height: 60,
        indicatorColor: const Color.fromRGBO(145, 144, 236, 0),
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: const Color.fromRGBO(145, 144, 236, 1),
        destinations: const [
          NavigationDestination(
              icon: FaIcon(
                FontAwesomeIcons.house,
                size: 30,
                color: Colors.white,
              ),
              label: ""),
          NavigationDestination(
              icon: FaIcon(
                FontAwesomeIcons.chartPie,
                size: 30,
              ),
              label: ""),
          NavigationDestination(
              icon: FaIcon(
                FontAwesomeIcons.gear,
                size: 30,
              ),
              label: ""),
        ],
      ),
    );
  }
}
