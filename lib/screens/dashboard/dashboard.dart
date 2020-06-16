import 'package:flutter/material.dart';
import 'package:petsaojoao/models/dashboard/analytics.dart';
import 'package:petsaojoao/screens/dashboard/action_card.dart';
import 'package:petsaojoao/screens/dashboard/dashboard_app_bar.dart';
import 'package:petsaojoao/screens/dashboard/dashboard_drawer.dart';
import 'package:petsaojoao/screens/dashboard/info_card.dart';
import 'package:petsaojoao/services/dashboard/api_rest_analytics.dart';
import 'constants.dart' as Constants;

class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DashboardState();
  }
}

class DashboardState extends State<Dashboard> {
  Future<Analytics> futureAnalytics;

  @override
  void initState() {
    super.initState();
    futureAnalytics = ApiRestAnalytics.all();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Stack(children: <Widget>[
          DashboardAppBar(future: futureAnalytics),
        ]),
        preferredSize: const Size.fromHeight(180.0),
      ),
      drawer: DashboardDrawer(),
      body: Center(
        child: FutureBuilder<Analytics>(
          future: futureAnalytics,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: InfoCard(
                          resource: Constants.PETS_CARD_OPTION,
                          icon: const Icon(
                            Icons.pets,
                            color: Colors.white,
                          ),
                          total: snapshot.data.totalRegisteredPets,
                          totalDay: snapshot.data.totalPetsRegisteredToday,
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: InfoCard(
                          resource: Constants.TUTORS_CARD_OPTION,
                          icon: const Icon(
                            Icons.people,
                            color: Colors.white,
                          ),
                          total: snapshot.data.totalRegisteredTutors,
                          totalDay: snapshot.data.totalTutorsRegisteredToday,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: InfoCard(
                          resource: Constants.PHOTOS_CARD_OPTION,
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                          total: snapshot.data.totalRegisteredPetPhotos,
                          totalDay: snapshot.data.totalPetPhotosRegisteredToday,
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: InfoCard(
                          resource: Constants.ALERTS_CARD_OPTION,
                          icon: const Icon(Icons.notifications,
                              color: Colors.white),
                          total: 0,
                          totalDay: 0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                        child: ActionCard(
                          title: Constants.ACTION_CARD_TITLE,
                          body: Constants.ACTION_CARD_BODY,
                          buttonText: Constants.ACTION_CARD_BUTTON_TEXT,
                        ),
                      )
                    ],
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return const Text(Constants.LOAD_DATA_ERROR);
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
