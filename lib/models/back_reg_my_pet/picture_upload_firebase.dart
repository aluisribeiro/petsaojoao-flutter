import 'dart:io';

import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';

sendToServer() async {
  final pathImg = join(
    (await getTemporaryDirectory()).path,
    'PET-img1.png',
  );
  final pathImg2 = join(
    (await getTemporaryDirectory()).path,
    'PET-img2.png',
  );
  final pathImg3 = join(
    (await getTemporaryDirectory()).path,
    'PET-img3.png',
  );

  return uploadFirstPicture(pathImg, pathImg2, pathImg3);
}

Future uploadFirstPicture(
    String pathImg, String pathImg2, String pathImg3) async {
  StorageReference fireBaseStorageRef =
      FirebaseStorage.instance.ref().child('Pet/Pet-Img1');
  StorageUploadTask uploadTask = fireBaseStorageRef.putFile(File(pathImg));

  await uploadTask.onComplete;
  print('Primeira Imagem Enviada!');

  return uploadSecondPicture(pathImg2, pathImg3);
}

Future uploadSecondPicture(String pathImg2, String pathImg3) async {
  StorageReference fireBaseStorageRef =
      FirebaseStorage.instance.ref().child('Pet/Pet-Img2');
  StorageUploadTask uploadTask = fireBaseStorageRef.putFile(File(pathImg2));

  await uploadTask.onComplete;
  print('Segunda Imagem Enviada!');

  return uploadThirdPicture(pathImg3);
}

Future uploadThirdPicture(String pathImg3) async {
  StorageReference fireBaseStorageRef =
      FirebaseStorage.instance.ref().child('Pet/Pet-Img3');
  StorageUploadTask uploadTask = fireBaseStorageRef.putFile(File(pathImg3));

  await uploadTask.onComplete;
  print('Terceira Imagem Enviada!');

  return "complete";
}
