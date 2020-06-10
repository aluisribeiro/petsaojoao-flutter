import 'package:url_launcher/url_launcher.dart';

class buttomFunctions {
  void launchWhatsapp() async {
    const whatsapp = 'https://wa.me/5519982982891';
    if (await canLaunch(whatsapp)) {
      await launch(whatsapp);
    } else {
      throw 'Could not launch $whatsapp';
    }
  }

  void makeCall() async{
    const phonenumber = "tel:982982891";

    if(await canLaunch(phonenumber)) {
      await launch(phonenumber);
    } else {
      throw 'Could not call';
    }
  }

  void createEmail() async{
    const emailaddress = 'mailto:otto.spreng@sou.unifeob.edu.br?subject=Sample Subject&body=This is a Sample email';

    if(await canLaunch(emailaddress)) {
      await launch(emailaddress);
    }  else {
      throw 'Could not Email';
    }
  }
}