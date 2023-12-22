import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:learnverse/widgets/squareBackground.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:dropdown_button2/dropdown_button2.dart';


class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  

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
              Color.fromRGBO(117, 123, 200, 1),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [ Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                   child: Text('Dashboard',
                       style: TextStyle(
                                       color: Color.fromARGB(255, 255, 255, 255),
                                       fontSize: 40,
                                       fontWeight: FontWeight.w700,
                                      )),
                  ),
                  const SizedBox(
                    child: CircleAvatar(
                      minRadius: 30,
                      maxRadius: 30,
                    ),
                  )
                ],
              ),
              Padding(
               padding: EdgeInsets.only(
                        right: 150.0, 
                        top: 50.0,),
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
                            offset: Offset(4, 4), // changes position of shadow
                          ),
                          BoxShadow(
                            color: Color.fromARGB(255, 114, 114, 114),
                            spreadRadius: -4,
                            blurRadius: 6,
                            offset: Offset(-4, -4), // changes position of shadow
                          ),
                        ],
                      border: Border.all(
                              color: Color.fromARGB(255, 255, 255, 255)),
                      
                      borderRadius: BorderRadius.circular(40),
                          ),
                           child: Container(
                            width: 10.0,
                            child: PieChart(
                                      PieChartData(
                                        centerSpaceRadius:50,
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
               padding: EdgeInsets.only(
                        left: 150.0, 
                        top: 70.0,),
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
                              offset: Offset(4, 4), // changes position of shadow
                            ),
                            BoxShadow(
                              color: Color.fromARGB(255, 114, 114, 114),
                              spreadRadius: -4,
                              blurRadius: 6,
                              offset: Offset(-4, -4), // changes position of shadow
                            ),
                          ],
                      border: Border.all(
                              color: Color.fromARGB(255, 255, 255, 255)),
                      borderRadius: BorderRadius.circular(40),
                          ),
                          child: Container(
                            width: 10.0,
                            child: PieChart(
                                      PieChartData(
                                        centerSpaceRadius:50,
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
             Row(
         children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                     child: Text('Watchlist',
                         style: TextStyle(
                                         color: Color.fromARGB(255, 255, 255, 255),
                                         fontSize: 40,
                                         fontWeight: FontWeight.w700,
                                        )),
                    ),
                ),

         ],



            
            ),
          ],
        ),

          
        ),
      ),
    ]));
  }
}
