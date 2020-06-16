import 'package:flutter/material.dart';
import 'package:petsaojoao/screens/register_tutor/register_tutor.dart';
import 'constants.dart' as Constants;

class DashboardDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.white10),
              accountName: const Text(
                Constants.DRAWER_NAME,
                style: const TextStyle(color: Colors.black87),
              ),
              accountEmail: const Text(
                Constants.DRAWER_EMAIL,
                style: const TextStyle(color: Colors.black87),
              ),
              currentAccountPicture: const CircleAvatar(
                radius: 30.0,
                backgroundColor: Colors.blue,
                child: const Text(
                  Constants.DRAWER_NAME_INITIAL,
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text(Constants.DRAWER_PROFILE),
            ),
            ListTile(
              leading: const Icon(Icons.pets),
              title: const Text(Constants.DRAWER_SAVE_MY_PET),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterTutor()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text(Constants.DRAWER_FIND_A_PET),
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text(Constants.DRAWER_LOGOUT),
            ),
          ],
        ),
      );
  }

}