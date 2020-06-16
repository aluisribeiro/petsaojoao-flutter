import 'package:flutter/material.dart';
import 'package:petsaojoao/models/dashboard/analytics.dart';
import 'constants.dart' as Constants;

class DashboardAppBar extends StatelessWidget {
  Future<Analytics> _futureAnalytics;

  DashboardAppBar({Future<Analytics> future}) {
    this._futureAnalytics = future;
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(Constants.APP_BAR_TITLE),
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(150.0),
        child: FutureBuilder<Analytics>(
          future: this._futureAnalytics,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                padding: const EdgeInsets.only(left: 16, bottom: 16),
                height: 110.0,
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      Constants.APP_BAR_WELCOME,
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      "${snapshot.data.totalRegisteredTutors} usuários ativos",
                      style: const TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    const Text(
                      Constants.APP_BAR_PET_LOVER,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Container(
                padding: const EdgeInsets.only(left: 16, bottom: 16),
                height: 110.0,
                alignment: Alignment.centerLeft,
                child: const Text(
                  Constants.APP_BAR_ISSUE,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              );
            }

            return Container(
              padding: const EdgeInsets.only(left: 16, bottom: 16),
              height: 110.0,
              alignment: Alignment.centerLeft,
              child: const Text(
                Constants.APP_BAR_LOADING,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            );
          },
        ),
      ),
    );
  }
}
