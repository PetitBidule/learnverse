import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learnverse/utils/constants.dart';
import 'package:learnverse/view/hometheme_view.dart';
import 'package:learnverse/view/settings_view.dart';
import 'package:learnverse/widgets/square_background.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<String> filtres = [
    "Date d'ajout",
    'Anciens',
    'Populaires',
  ];
  final List<String> style = [
    'Manga',
    'Séries',
    'Manwhua',
    'Film',
  ];
  int currentPageIndex = 0;

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomLeft,
                    colors: [
                  Color.fromRGBO(224, 195, 252, 1),
                  Color.fromRGBO(203, 178, 254, 1),
                  Color.fromRGBO(159, 160, 255, 1),
                  AllConstants.backgroundContainer,
                ])),
          ),
          const SquareBackground(
            right: 100,
            top: 100,
            backgroundSquare: Color.fromRGBO(142, 148, 242, 1),
          ),
          const SquareBackground(
            right: 75,
            top: 350,
            backgroundSquare: Color.fromRGBO(117, 123, 233, 1),
          ),
          const SquareBackground(
            left: 50,
            top: 350,
            backgroundSquare: Color.fromRGBO(218, 182, 252, 1),
          ),
          const SquareBackground(
            left: 125,
            bottom: 50,
            backgroundSquare: Color.fromRGBO(203, 178, 254, 1),
          ),
          const SquareBackground(
            right: 100,
            bottom: 250,
            backgroundSquare: Color.fromRGBO(224, 195, 252, 1),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
            child: Container(
              color: Colors.black.withOpacity(0.1),
            ),
          ),
          SafeArea(
            child: Center(
              child: ListView(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Dashboard',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                            )),
                        SizedBox(
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage("asset/image/Profil.png"),
                            minRadius: 30,
                            maxRadius: 30,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text('Watchlist',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                              )),
                        ),
                        Container(
                          width: 110,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [],
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 255, 255, 255)),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: Text(
                                'filtres',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: filtres
                                  .map(
                                      (String item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 14,
                                              ),
                                            ),
                                          ))
                                  .toList(),
                              value: selectedValue,
                              onChanged: (String? value) => setState(() {
                                selectedValue = value;
                              }),
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                height: 40,
                                width: 140,
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 110,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: const [],
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255)),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                hint: Text(
                                  'Styles',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Theme.of(context).hintColor,
                                  ),
                                ),
                                items: style
                                    .map((String item) =>
                                        DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                value: selectedValue,
                                onChanged: (String? value) => setState(() {
                                  selectedValue = value;
                                }),
                                buttonStyleData: const ButtonStyleData(
                                  padding: EdgeInsets.symmetric(horizontal: 16),
                                  height: 40,
                                  width: 140,
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 40,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: SizedBox(
                        height: 250,
                        child: ListView.builder(
                          itemCount: 2,
                          itemBuilder: (BuildContext context, index) {
                            return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      borderRadius: BorderRadius.circular(9)),
                                  child: ListTile(
                                    leading: Image.asset(
                                      "asset/image/onePiece.jpeg",
                                      width: 38,
                                      height: 48,
                                    ),
                                    title: const Text('One Piece - 1089 ep'),
                                    trailing: const Icon(Icons.delete),
                                  ),
                                ));
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 150.0,
                        top: 50.0,
                      ),
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.7),
                              spreadRadius: -4,
                              blurRadius: 6,
                              offset: const Offset(
                                  4, 4), // changes position of shadow
                            ),
                            const BoxShadow(
                              color: Color.fromARGB(255, 114, 114, 114),
                              spreadRadius: -4,
                              blurRadius: 6,
                              offset:
                                  Offset(-4, -4), // changes position of shadow
                            ),
                          ],
                          border: Border.all(
                              color: const Color.fromARGB(255, 255, 255, 255)),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: SizedBox(
                          width: 10.0,
                          child: PieChart(
                            PieChartData(
                              centerSpaceRadius: 50,
                              sections: [
                                PieChartSectionData(
                                  color: Colors.blue,
                                  value: 40,
                                  title: 'manga',
                                  radius: 30,
                                ),
                                PieChartSectionData(
                                  color: Colors.red,
                                  value: 30,
                                  title: 'livre ',
                                  radius: 30,
                                ),
                                PieChartSectionData(
                                  color: Colors.green,
                                  value: 50,
                                  title: 'séries',
                                  radius: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 150.0,
                        top: 70.0,
                      ),
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.7),
                              spreadRadius: -4,
                              blurRadius: 6,
                              offset: const Offset(
                                  4, 4), // changes position of shadow
                            ),
                            const BoxShadow(
                              color: Color.fromARGB(255, 114, 114, 114),
                              spreadRadius: -4,
                              blurRadius: 6,
                              offset:
                                  Offset(-4, -4), // changes position of shadow
                            ),
                          ],
                          border: Border.all(
                              color: const Color.fromARGB(255, 255, 255, 255)),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: SizedBox(
                          width: 10.0,
                          child: PieChart(
                            PieChartData(
                              centerSpaceRadius: 50,
                              sections: [
                                PieChartSectionData(
                                  color: Colors.blue,
                                  value: 40,
                                  title: 'manga',
                                  radius: 30,
                                ),
                                PieChartSectionData(
                                  color: Colors.red,
                                  value: 30,
                                  title: 'livre ',
                                  radius: 30,
                                ),
                                PieChartSectionData(
                                  color: Colors.green,
                                  value: 50,
                                  title: 'séries',
                                  radius: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ]),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
              if (currentPageIndex == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ThemeScreen()),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Settings()),
                );
              }
            });
          },
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
                ),
                label: ""),
            NavigationDestination(
                icon: FaIcon(
                  FontAwesomeIcons.chartPie,
                  size: 30,
                  color: Colors.white,
                ),
                label: ""),
            NavigationDestination(
                icon: FaIcon(
                  FontAwesomeIcons.gear,
                  size: 30,
                ),
                label: ""),
          ],
        ));
  }
}
