import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:learnverse/utils/constants.dart';
import 'package:learnverse/widgets/all_bouton.dart';
import 'package:learnverse/widgets/square_background.dart';

class privacy extends StatelessWidget {
  privacy({super.key});
  final List<TextEditingController> _controller =
      List.generate(2, (int index) => TextEditingController());
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 314.0),
              child: Image.asset("asset/image/logoLearnVerse.png", width:60, height:60,),
            ),
             const Padding(
               padding: EdgeInsets.only(top:24.0),
               child: SizedBox(
                width: 400,
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text('Terms & Conditions',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.w700,
                      )),
                ),
                ),
                
             ), 
               SizedBox(
              height: 450,
              child:  ListView(
                children: const [Text('''
                    Terms and Conditions
                    Welcome to Learnverse!
                    These terms and conditions outline the rules and regulations for the use of LearnVerse's Website, located at learnverse.fr.
                    By accessing this website we assume you accept these terms and conditions. Do not continue to use Learnverse if you do not agree to take all of the terms and conditions stated on this page.
                    The following terminology applies to these Terms and Conditions, Privacy Statement and Disclaimer Notice and all Agreements: "Client", "You" and "Your" refers to you, the person log on this website and compliant to the Company's terms and conditions. "The Company", "Ourselves", "We", "Our" and "Us", refers to our Company. "Party", "Parties", or "Us", refers to both the Client and ourselves. All terms refer to the offer, acceptance and consideration of payment necessary to undertake the process of our assistance to the Client in the most appropriate manner for the express purpose of meeting the Client's needs in respect of provision of the Company's stated services, in accordance with and subject to, prevailing law of fr. Any use of the above terminology or other words in the singular, plural, capitalization and/or he/she or they, are taken as interchangeable and therefore as referring to same.
                    License
                    Unless otherwise stated, LearnVerse and/or its licensors own the intellectual property rights for all material on Learnverse. All intellectual property rights are reserved. You may access this from Learnverse for your own personal use subjected to restrictions set in these terms and conditions.
                    You must not:
                    * Republish material from Learnverse
                    * Sell, rent or sub-license material from Learnverse
                    * Reproduce, duplicate or copy material from Learnverse
                    * Redistribute content from Learnverse
                    This Agreement shall begin on the date hereof. Our Terms and Conditions were created with the help of theÂ Free Terms and Conditions Generator.
                    Parts of this website offer an opportunity for users to post and exchange opinions and information in certain areas of the website. LearnVerse does not filter, edit, publish or review Comments prior to their presence on the website. Comments do not reflect the views and opinions of LearnVerse,its agents and/or affiliates. Comments reflect the views and opinions of the person who post their views and opinions. To the extent permitted by applicable laws, LearnVerse shall not be liable for the Comments or for any liability, damages or expenses caused and/or suffered as a result of any use of and/or posting of and/or appearance of the Comments on this website.
                    LearnVerse reserves the right to monitor all Comments and to remove any Comments which can be considered inappropriate, offensive or causes breach of these Terms and Conditions.
                    You warrant and represent that:
                    * You are entitled to post the Comments on our website and have all necessary licenses and consents to do so;
                    * The Comments do not invade any intellectual property right, including without limitation copyright, patent or trademark of any third party;
                    * The Comments do not contain any defamatory, libelous, offensive, indecent or otherwise unlawful material which is an invasion of privacy
                    * The Comments will not be used to solicit or promote business or custom or present commercial activities or unlawful activity.
                    You hereby grant LearnVerse a non-exclusive license to use, reproduce, edit and authorize others to use, reproduce and edit any of your Comments in any and all forms, formats or media.
                    iFrames
                    Without prior approval and written permission, you may not create frames around our Webpages that alter in any way the visual presentation or appearance of our Website.
                    Content Liability
                    We shall not be hold responsible for any content that appears on your Website. You agree to protect and defend us against all claims that is rising on your Website. No link(s) should appear on any Website that may be interpreted as libelous, obscene or criminal, or which infringes, otherwise violates, or advocates the infringement or other violation of, any third party rights.
                    Reservation of Rights
                    We reserve the right to request that you remove all links or any particular link to our Website. You approve to immediately remove all links to our Website upon request. We also reserve the right to amen these terms and conditions and it's linking policy at any time. By continuously linking to our Website, you agree to be bound to and follow these linking terms and conditions.
                    Disclaimer
                    To the maximum extent permitted by applicable law, we exclude all representations, warranties and conditions relating to our website and the use of this website. Nothing in this disclaimer will:
                    * limit or exclude our or your liability for death or personal injury;
                    * limit or exclude our or your liability for fraud or fraudulent misrepresentation;
                    * limit any of our or your liabilities in any way that is not permitted under applicable law; or
                    * exclude any of our or your liabilities that may not be excluded under applicable law.
                    The limitations and prohibitions of liability set in this Section and elsewhere in this disclaimer: (a) are subject to the preceding paragraph; and (b) govern all liabilities arising under the disclaimer, including liabilities arising in contract, in tort and for breach of statutory duty.
                    As long as the website and the information and services on the website are provided free of charge, we will not be liable for any loss or damage of any nature.")],''',
                                style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                              )),
                    ],
                    
              ),
            ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 300,
                        height: 60,
                        decoration: BoxDecoration(
                           gradient: const LinearGradient(
                            colors:[
                              Color.fromARGB(255, 153, 118, 224),
                              Color.fromARGB(255, 153, 107, 156),
                              Color.fromARGB(255, 191, 95, 164),
                              Color.fromARGB(255, 145, 35, 81),
                              Color.fromARGB(255, 150, 35, 53),
                              Color.fromARGB(255, 233, 80, 59),
                              Color.fromARGB(255, 250, 157, 110),
                              Color.fromARGB(255, 255, 166, 77),
                            ]
                          ),
                          border: Border.all(color:
                                        const Color.fromARGB(255, 255, 255, 255)),
                                borderRadius: BorderRadius.circular(20),),
                                child: const Center(
                                  child: Text(
                                    "Agree",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ),
                        ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 300,
                        height: 60,
                        decoration: BoxDecoration( 
                          color: Colors.white,
                          border: Border.all(color:
                                        const Color.fromARGB(255, 255, 255, 255)),
                                borderRadius: BorderRadius.circular(20),),
                                child: const Center(
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700
                                    ),
                                  ),
                                ),
                        ),
                    ),
          
                    
          ],
        ),
        
      )),
    ]));
  }
}
