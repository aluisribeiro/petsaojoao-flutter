import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:firebase_auth/firebase_auth.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;
  
  Future<String> signUpWithFacebook() async{
    try {
      final facebookLogin = new FacebookLogin();
      final result = await facebookLogin.logIn(['email']);

      if(result.status == FacebookLoginStatus.loggedIn) {
        final AuthCredential credential = FacebookAuthProvider.getCredential(
          accessToken: result.accessToken.token,

        );
        final FirebaseUser user = (await FirebaseAuth.instance.signInWithCredential(credential)).user;
        print('signed in ' + user.displayName);
        return "$user";
      }
    }catch (e) {
      print(e.message);
    }
  }

