import 'package:flutter/material.dart';

class ActionCard extends StatelessWidget {
  String _title;
  String _body;
  String _buttonText;

  ActionCard({String title, String body, String buttonText}) {
    this._title = title;
    this._body = body;
    this._buttonText = buttonText;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              this._title,
              style: Theme.of(context).textTheme.title,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Opacity(
                opacity: 0.5,
                child: Text(
                  this._body,
                  style: Theme.of(context).textTheme.body2,
                ),
              ),
            ),
            ButtonBar(
              buttonPadding: const EdgeInsets.only(top: 10),
              alignment: MainAxisAlignment.start,
              children: <Widget>[
                FlatButton(
                  child: Text(this._buttonText),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
