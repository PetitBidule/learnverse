import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learnverse/utils/constants.dart';
import 'package:learnverse/view/hometheme_view.dart';
import 'package:learnverse/widgets/square_background.dart';


class Privacy extends StatelessWidget {
  const Privacy({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
                ],
              ),
            ),
          ),
          const SquareBackground(
            right: 100,
            top: 100,
            backgroundSquare: Color.fromRGBO(142, 148, 242, 1),
          ),
          // ... (Other SquareBackground widgets)
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
            child: Container(
              color: Colors.black.withOpacity(0.1),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "asset/image/logoLearnVerse.png",
                            width: 40,
                            height: 40,
                          ),
                          const FaIcon(FontAwesomeIcons.close,
                              color: Colors.white)
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 24.0),
                      child: SizedBox(
                        width: 400,
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            'Terms &',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //  Padding(
                    //   padding: const EdgeInsets.only(right:112.0),
                    //   child:GradientText(
                    //         'Conditions',
                    //         style: const TextStyle(
                    //           fontSize: 50,
                    //           fontWeight: FontWeight.w700,
                    //         ),
                    //         colors: const [
                    //         Color.fromARGB(255, 153, 118, 224),
                    //         Color.fromARGB(255, 153, 107, 156),
                    //         ],
                    //     ),
                    // ),
                    SizedBox(
                      width: 400,
                      height: 450,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: ListView(children: const [
                          Text(
                            'Terms and Conditions\n'
                            'Welcome to Learnverse!\n'
                            'These terms and conditions outline the rules and regulations for the use of LearnVerse\'s Website, located at learnverse.fr.\n'
                            'By accessing this website we assume you accept these terms and conditions. Do not continue to use Learnverse if you do not agree to take all of the terms and conditions stated on this page.\n'
                            '\n'
                            'The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: "Client", "You" and "Your" refers to you, the person log on this website and compliant to the Company\'s terms and conditions. "The Company", "Ourselves", "We", "Our" and "Us", refers to our Company. "Party", "Parties", or "Us", refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client\'s needs in respect of provision of the Company\'s stated services, in accordance with and subject to, prevailing law of fr. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same.\n'
                            '\n'
                            'License\n'
                            'Unless otherwise stated, LearnVerse and/or its licensors own the intellectual property rights for all material on Learnverse. All intellectual property rights are reserved. You may access this from Learnverse for your own personal use subjected to restrictions set in these terms and conditions.\n'
                            'You must not:\n'
                            '* Republish material from Learnverse\n'
                            '* Sell, rent or sub-license material from Learnverse\n'
                            '* Reproduce, duplicate or copy material from Learnverse\n'
                            '* Redistribute content from Learnverse\n'
                            'This Agreement shall begin on the date hereof. Our Terms and Conditions were created with the help of the Free Terms and Conditions Generator.\n'
                            '\n'
                            'Parts of this website offer an opportunity for users to post and exchange opinions and information in certain areas of the website. LearnVerse does not filter, edit, publish or review Comments prior to their presence on the website. Comments do not reflect the views and opinions of LearnVerse, its agents and/or affiliates. Comments reflect the views and opinions of the person who posts their views and opinions. To the extent permitted by applicable laws, LearnVerse shall not be liable for the Comments or for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this website.\n'
                            '\n'
                            'LearnVerse reserves the right to monitor all Comments and to remove any Comments which can be considered inappropriate, offensive or causes breach of these Terms and Conditions.\n'
                            '\n'
                            'You warrant and represent that:\n'
                            '* You are entitled to post the Comments on our website and have all necessary licenses and consents to do so;\n'
                            '* The Comments do not invade any intellectual property right, including without limitation copyright, patent or trademark of any third party;\n'
                            '* The Comments do not contain any defamatory, libelous, offensive, indecent or otherwise unlawful material which is an invasion of privacy\n'
                            '* The Comments will not be used to solicit or promote business or custom or present commercial activities or unlawful activity.\n'
                            '\n'
                            'You hereby grant LearnVerse a non-exclusive license to use, reproduce, edit and authorize others to use, reproduce and edit any of your Comments in any and all forms, formats or media.\n'
                            '\n'
                            'iFrames\n'
                            'Without prior approval and written permission, you may not create frames around our Webpages that alter in any way the visual presentation or appearance of our Website.\n'
                            '\n'
                            'Content Liability\n'
                            'We shall not be held responsible for any content that appears on your Website. You agree to protect and defend us against all claims that are rising on your Website. No link(s) should appear on any Website that may be interpreted as libelous, obscene or criminal, or which infringes, otherwise violates, or advocates the infringement or other violation of, any third party rights.\n'
                            '\n'
                            'Reservation of Rights\n'
                            'We reserve the right to request that you remove all links or any particular link to our Website. You approve to immediately remove all links to our Website upon request. We also reserve the right to amend these terms and conditions and its linking policy at any time. By continuously linking to our Website, you agree to be bound to and follow these linking terms and conditions.\n'
                            '\n'
                            'Disclaimer\n'
                            'To the maximum extent permitted by applicable law, we exclude all representations, warranties and conditions relating to our website and the use of this website. Nothing in this disclaimer will:\n'
                            '* limit or exclude our or your liability for death or personal injury;\n'
                            '* limit or exclude our or your liability for fraud or fraudulent misrepresentation;\n'
                            '* limit any of our or your liabilities in any way that is not permitted under applicable law; or\n'
                            '* exclude any of our or your liabilities that may not be excluded under applicable law.\n'
                            '\n'
                            'The limitations and prohibitions of liability set in this Section and elsewhere in this disclaimer: (a) are subject to the preceding paragraph; and (b) govern all liabilities arising under the disclaimer, including liabilities arising in contract, in tort and for breach of statutory duty.\n'
                            '\n'
                            'As long as the website and the information and services on the website are provided free of charge, we will not be liable for any loss or damage of any nature.',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                            ),
                          ),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 300,
                        height: 60,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            Color.fromARGB(255, 153, 118, 224),
                            Color.fromARGB(255, 153, 107, 156),
                            // ... (Other gradient colors)
                          ]),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ThemeScreen()),
                              );
                            },
                            child: const Text(
                              'Agree',
                              style: TextStyle(color: Colors.white),
                            ),
                            // style: ButtonStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
