import 'package:portfolio/constants/constants.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;
import 'package:universal_io/io.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

class CopyrightWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        color: Constants.myPrimaryColor,
        height: 170.0,
        child: Column(
          children: <Widget>[
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                socialMediaLinks(Constants.facebook, Constants.facebookUrl),
                socialMediaLinks(Constants.twitter, Constants.twitterUrl),
                socialMediaLinks(Constants.github, Constants.githubUrl),
                socialMediaLinks(Constants.linkedin, Constants.linkedinUrl),
              ],
            ),
            SizedBox(height: 10.0),
            Container(
              child: Text(
                "Designed & Coded by ramu",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 30.0),
          ],
        ));
  }

  Widget socialMediaLinks(String image, String url) {
    return InkWell(
      onTap: () => launchUrl(url),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(
            color: Colors.white60,
            width: 3.0,
          ),
        ),
        child: Image.asset(
          image,
          height: 30.0,
          width: 30.0,
          color: Colors.white,
          colorBlendMode: BlendMode.darken,
        ),
      ),
    );
  }

  launchUrl(String url) async {
    if (kIsWeb) {
      html.window.location.href = url;
      // html.window.location.assign(url);
    } else if (Platform.isAndroid || Platform.isIOS) {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } else {
      throw Exception("Unknown Platform");
    }
  }
}
// *Copyright © ramubugudi 2019
