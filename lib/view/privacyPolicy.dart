import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:learnverse/utils/constants.dart';
import 'package:learnverse/view/hometheme_view.dart';
import 'package:learnverse/widgets/square_background.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class Privacypolicy extends StatefulWidget {
  const Privacypolicy({super.key});

  @override
  State<Privacypolicy> createState() => _PrivacypolicyState();
}

class _PrivacypolicyState extends State<Privacypolicy> {
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
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.white,
                      onPressed: () => setState(() => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ThemeScreen(
                                      firstConnexion: false,
                                    )),
                          )),
                      iconSize: 36.0,
                    ),
                     Padding(
                          padding: const EdgeInsets.only(right:48.0),
                          child: GradientText(
                                  'Privacy Policy',
                                  style: const TextStyle(
                                    fontSize: 36,
                                    fontWeight: FontWeight.w700,
                                  ),
                              colors: const [
                                  Color.fromARGB(255, 153, 118, 224),
                                  Color.fromARGB(255, 153, 107, 156),
                                  ],
                          ),
                        ),
                       ],
                     ),
        
                      ),
                    const Divider(
                      indent: 10,
                      endIndent: 30,
                    ),
                    const SizedBox(height: 16.0),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '''Learnverse built the LearnVerse app as a Freemium app. This SERVICE is provided by Learnverse at no cost and is intended for use as is.
                    
This page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service.
                    
If you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.
                    
The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which are accessible at LearnVerse unless otherwise defined in this Privacy Policy.''',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '''For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information, including but not limited to Email, username. The information that we request will be retained by us and used as described in this privacy policy.
                    
The app does use third-party services that may collect information used to identify you.
                    
Link to the privacy policy of third-party service providers used by the app:
                    
* [Google Play Services]\n(https://www.google.com/policies/privacy/)
* [AdMob]\n(https://support.google.com/admob/answer/6128543?hl=en)''',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
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
