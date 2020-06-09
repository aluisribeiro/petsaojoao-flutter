import 'package:flutter/material.dart';
import 'package:petsaojoao/screens/dashboard/dashboard.dart';
import '../../models/utils_firebase/firebase_auth.dart';
import '../dashboard/dashboard.dart';
import '../register_tutor/personal_info.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';


//Acompanhe desing do projeto aqui --> https://www.figma.com/file/GYFrt79mzIbOUXXmFyDgwL/Material-Baseline-Design-Kit?node-id=38%3A5814

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
            children: <Widget> [
              ClipWavy(),
              LogoApp(),
              Padding(
                padding: EdgeInsets.only(top: 250, left: 30, right: 30,
                ),
                child: Container(
                  child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 90,
                        ),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text (
                                      "Entre",
                                      style: TextStyle(
                                        fontSize: 35,
                                        color: Colors.black45,
                                      ),
                                    ),

                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text (
                                      "E seja bem vindo!",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black45,
                                      ),
                                    ),
                                  ]
                              ),

                              Spacer(flex: 6),
                              Container(
                                height: 100,
                                alignment: Alignment.centerRight,
                                child: Image.asset("assets/login/townhall.png"),
                              ),
                            ]
                        ),

                        Divider(
                          color: Colors.grey,
                          thickness: 1,
                          indent: 2,
                          endIndent: 100,
                        ),

                        SizedBox(
                          height: 50,
                        ),

                        SocialLogin(),
                      ]
                  ),
                ),
              ),

              Container(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.maxFinite,
                  height: 30,
                  color: Colors.blueAccent[200],
                  child:
                  Image.asset("assets/login/logo-unifeob.png"),
                ),
              ),
            ]
        ),
      ),
    );
  }
}

class ClipHome extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height-30);

    path.quadraticBezierTo(size.width/90, size.height-110, size.width-160, size.height-100);
    path.quadraticBezierTo(size.width-(size.width/20), size.height-90, size.width, size.height-160);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ClipWavy extends StatelessWidget {
  final _imgPaws=Image.asset("assets/login/legs.png");
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClipHome(),
      child: Container(
        child: Opacity(
          opacity: 0.35,
          child: _imgPaws,
        ),
       height: 350,
        color: Colors.blueAccent[200],
      ),

//      width: double.maxFinite, height: 303,
    );
  }
}

class LogoApp extends StatelessWidget {
  final _imgLogo=Image.asset("assets/login/logoDogWhite.png");
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 60
      ),
      height: 170,
      width: double.maxFinite,
      alignment: Alignment.center,
//        decoration: BoxDecoration(
//          gradient: RadialGradient(
//              colors: [Colors.white70, Colors.white]
//          ),
//        ),
      child: _imgLogo,
    );
  }
}

class SocialLogin extends StatelessWidget {
  final _imgFacebook = Image.asset("assets/login/facebook.png");
  final _imgGmail = Image.asset("assets/login/gmail.png");
  final _imgTwitter = Image.asset("assets/login/twitter.png");

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 60,
            width: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.blueAccent[200],
            ),
            child: FlatButton(
              child: SizedBox(
                child: _imgFacebook,
                height: 50,
                width: 50,
              ),
              onPressed: () {
                  //signUpWithFacebook();
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Dashboard()
                  ),
                );
              },
            ),
          ),
          Spacer(flex: 2),
          Container(
            height: 60,
            width: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.blueAccent[200],
            ),
            child: FlatButton(
              child: SizedBox(
                child: _imgGmail,
                height: 50,
                width: 50,
              ),
              onPressed: () async {
                bool res = await AuthProvider().loginWithGoogle();
                  if(!res)
                    print("error logging in with google");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Dashboard()),
                );
              },
            ),
          ),
          Spacer(flex: 2),
          Container(
            height: 60,
            width: 65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.blueAccent[200],
            ),
            child: FlatButton(
              child: SizedBox(
                child: _imgTwitter,
                height: 50,
                width: 50,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Dashboard()),
                );
              },
            ),
          ),
        ]
    );
  }
}
