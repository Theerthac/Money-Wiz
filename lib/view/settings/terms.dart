// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../settingScreen/settings.dart';


class Term extends StatelessWidget {
  String username;
   Term({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 140,
              decoration: const BoxDecoration(
                  color: Color(0xFFFDC603),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  )),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return Settings(
                                    username: username,
                                  );
                                },
                              ));
                            },
                            child: const Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            )),
                        const Text(
                          '     Terms & Conditions',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 150),
          child: ListView(
            children: const [
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                    """We are committed to protecting your privacy. This privacy policy sets out how we use and protect any information that you give us when you use our money management mobile app.
              
              We may collect the following information:
              
              1. Personal information such as name, email address, and phone number
              2. Transaction data such as account balances, income, and expenses
              3. Usage data such as app activity and preferences
              
              We collect this information to provide money management services and to improve the functionality of our app. We are committed to ensuring that your information is secure. We use industry-standard encryption to protect your financial data and personal information.
              
              We may share your information with third-party service providers, such as banks and payment processors, in order to provide money management services. We may also share your information with third-party analytics providers to improve the functionality of our app. We will not sell, rent, or lease your information to third parties.
              
              We may use your information to send you promotional emails about our products and services or other information which we think you may find interesting. You may opt out of receiving these emails at any time by clicking the unsubscribe link at the bottom of the email.
              
              You may request to access, modify, or delete your information at any time by contacting us. We will respond to your request within a reasonable timeframe.
              
              We may update this privacy policy from time to time by posting a new version on our website. You should check this page periodically to ensure that you are happy with any changes.
              
              If you have any questions about this privacy policy or how we use your information, please contact us.
                        
              """,
                    style: TextStyle(fontSize: 15, color: Colors.black87)),
              ),
            ],
          ),
        ),
      ],
    )));
  }
}
