import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  String _resource;
  Icon _icon;
  int _total;
  int _totalDay;

  InfoCard({resource, icon, total = 0, int totalDay = 0}) {
    this._resource = resource;
    this._icon = icon;
    this._total = total;
    this._totalDay = totalDay;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: EdgeInsets.all(7),
        child: Row(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  decoration: new BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: this._icon,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "${this._total} ${this._resource}",
                    overflow: TextOverflow.fade,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 10),
                  child: Text(
                    "${this._totalDay} hoje",
                    style: Theme.of(context).textTheme.caption,
                    overflow: TextOverflow.fade,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
