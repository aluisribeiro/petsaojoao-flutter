import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:progress_indicators/progress_indicators.dart';

class SplahScreenFoundation extends StatelessWidget {
  String contentText;
  SplahScreenFoundation(String contentText) {
    this.contentText = contentText;
  }
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Container(child: Image.asset('assets/background/top_paws.png')),
      SizedBox(
        height: 100,
      ),
      Center(
        child: Container(
          width: 350,
          child: Text(
            contentText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 35,
            ),
          ),
        ),
      ),
      SizedBox(height: 20),
      Center(
        child: CollectionSlideTransition(
          children: <Widget>[
            Transform.rotate(
              angle: -80,
              child: GlowingProgressIndicator(
                duration: Duration(milliseconds: 550),
                child: Icon(
                  FontAwesomeIcons.paw,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Transform.rotate(
              angle: -80,
              child: GlowingProgressIndicator(
                duration: Duration(milliseconds: 1000),
                child: Icon(
                  FontAwesomeIcons.paw,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Transform.rotate(
              angle: -80,
              child: GlowingProgressIndicator(
                duration: Duration(milliseconds: 1550),
                child: Icon(
                  FontAwesomeIcons.paw,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 100,
      ),
      Container(child: Image.asset('assets/background/bottom_paws.png')),
    ]);
  }
}
