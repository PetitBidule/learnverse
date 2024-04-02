import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnverse/utils/constantsColors.dart';
import 'package:learnverse/utils/constantsFont.dart';
import 'package:learnverse/widgets/square_background.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    super.key,
  });

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
    'Film',
  ];
  void showDialogBox(String name, String url) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: const Text('Ce dernier sera supprimer définitivement '),
            actions: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      FirebaseFirestore.instance
                          .collection('users')
                          .doc(FirebaseAuth.instance.currentUser?.email)
                          .update({
                        'watchlist': FieldValue.arrayRemove([
                          {
                            'url': url,
                            'name': name,
                          },
                        ]),
                      }).then((_) => Navigator.pop(context));
                    });
                  },
                  child: const Text('Delete')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancel'))
            ],
          );
        });
  }

  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
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
            child: ListView(children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text('Dashboard', style: AllConstants.title),
                      SizedBox(
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              '${FirebaseAuth.instance.currentUser?.photoURL}'),
                          minRadius: 28,
                          maxRadius: 28,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 110,
                        height: 30,
                        decoration: BoxDecoration(
                          color: ConstantsColors.iconColors,
                          border: Border.all(
                              color: const Color.fromARGB(255, 255, 255, 255)),
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
                                .map((String item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            value: _selectedValue,
                            onChanged: (String? value) => setState(() {
                              _selectedValue = value;
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
                            color: ConstantsColors.iconColors,
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
                              value: _selectedValue,
                              onChanged: (String? value) => setState(() {
                                _selectedValue = value;
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
                        child: FutureBuilder(
                            future: FirebaseFirestore.instance
                                .collection('users')
                                .doc(FirebaseAuth.instance.currentUser?.email)
                                .get(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var data = snapshot.data!.data();
                                var firstName = data!['watchlist'];
                                if (firstName.isEmpty) {
                                  return const Center(
                                    child: Text(
                                        "vous n'avez encore rien enregistrée"),
                                  );
                                } else {
                                  var data = snapshot.data!.data();
                                  var firstName = data!['watchlist'];
                                  return ListView.builder(
                                      itemCount: firstName.length,
                                      itemBuilder: (context, int index) {
                                        return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: const Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  borderRadius:
                                                      BorderRadius.circular(9)),
                                              child: ListTile(
                                                leading: Image.network(
                                                  firstName[index]['url'],
                                                  width: 38,
                                                  height: 48,
                                                ),
                                                title: Text(
                                                    firstName[index]['name']),
                                                trailing: GestureDetector(
                                                    onTap: () {
                                                      showDialogBox(
                                                          firstName[index]
                                                              ['name'],
                                                          firstName[index]
                                                              ['url']);
                                                    },
                                                    child: const Icon(
                                                        Icons.delete)),
                                              ),
                                            ));
                                      });
                                }
                              } else {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            })),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //     right: 150.0,
                  //     top: 50.0,
                  //   ),
                  //   child:
                  //   Container(
                  //     width: 200,
                  //     height: 200,
                  //     decoration: BoxDecoration(
                  //       color: ConstantsColors.iconColors,
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.grey.withOpacity(0.7),
                  //           spreadRadius: -4,
                  //           blurRadius: 6,
                  //           offset: const Offset(
                  //               4, 4), // changes position of shadow
                  //         ),
                  //         const BoxShadow(
                  //           color: Color.fromARGB(255, 114, 114, 114),
                  //           spreadRadius: -4,
                  //           blurRadius: 6,
                  //           offset:
                  //               Offset(-4, -4), // changes position of shadow
                  //         ),
                  //       ],
                  //       border: Border.all(
                  //           color: const Color.fromARGB(255, 255, 255, 255)),
                  //       borderRadius: BorderRadius.circular(40),
                  //     ),
                  //     child: SizedBox(
                  //       width: 10.0,
                  //       child: PieChart(
                  //         PieChartData(
                  //           centerSpaceRadius: 50,
                  //           sections: [
                  //             PieChartSectionData(
                  //               color: Colors.blue,
                  //               value: 40,
                  //               title: 'manga',
                  //               radius: 30,
                  //             ),
                  //             PieChartSectionData(
                  //               color: Colors.red,
                  //               value: 30,
                  //               title: 'livre ',
                  //               radius: 30,
                  //             ),
                  //             PieChartSectionData(
                  //               color: Colors.green,
                  //               value: 50,
                  //               title: 'séries',
                  //               radius: 30,
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //     left: 150.0,
                  //     top: 70.0,
                  //   ),
                  //   child: Container(
                  //     width: 200,
                  //     height: 200,
                  //     decoration: BoxDecoration(
                  //       color: ConstantsColors.iconColors,
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.grey.withOpacity(0.7),
                  //           spreadRadius: -4,
                  //           blurRadius: 6,
                  //           offset: const Offset(
                  //               4, 4), // changes position of shadow
                  //         ),
                  //         const BoxShadow(
                  //           color: Color.fromARGB(255, 114, 114, 114),
                  //           spreadRadius: -4,
                  //           blurRadius: 6,
                  //           offset:
                  //               Offset(-4, -4), // changes position of shadow
                  //         ),
                  //       ],
                  //       border: Border.all(
                  //           color: const Color.fromARGB(255, 255, 255, 255)),
                  //       borderRadius: BorderRadius.circular(40),
                  //     ),
                  //     child: SizedBox(
                  //       width: 10.0,
                  //       child: PieChart(
                  //         PieChartData(
                  //           centerSpaceRadius: 50,
                  //           sections: [
                  //             PieChartSectionData(
                  //               color: Colors.blue,
                  //               value: 40,
                  //               title: 'manga',
                  //               radius: 30,
                  //             ),
                  //             PieChartSectionData(
                  //               color: Colors.red,
                  //               value: 30,
                  //               title: 'livre ',
                  //               radius: 30,
                  //             ),
                  //             PieChartSectionData(
                  //               color: Colors.green,
                  //               value: 50,
                  //               title: 'séries',
                  //               radius: 30,
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}
