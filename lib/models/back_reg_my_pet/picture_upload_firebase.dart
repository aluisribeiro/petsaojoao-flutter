import 'dart:io';

import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:petsaojoao/models/back_reg_my_pet/get_information_for_pictures.dart';
import 'package:petsaojoao/components/reg_my_pet/alert_confirm.dart';

class FirebaseUpload {
  sendToServer(context) async {
    PopUpSelector().showLoading(context);
    int _tutorId = await GetInformation().getTutorId();
    int _petId = await GetInformation().getPetId();

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

    String res = await uploadFirstPicture(pathImg, pathImg2, pathImg3, _tutorId, _petId);
    return res;
  }

  Future uploadFirstPicture(
      String pathImg, String pathImg2, String pathImg3, _tutorId, _petId) async {
    StorageReference fireBaseStorageRef =
        FirebaseStorage.instance.ref().child('pet-images/Tutor:$_tutorId - Pet:$_petId - Img1');
    StorageUploadTask uploadTask = fireBaseStorageRef.putFile(File(pathImg));


    StorageTaskSnapshot imgUpload = await uploadTask.onComplete;
    String imgLink = await imgUpload.ref.getDownloadURL();

    String res = await uploadSecondPicture(pathImg2, pathImg3, _tutorId, _petId);
    return res;
  }

  Future uploadSecondPicture(String pathImg2, String pathImg3, _tutorId, _petId) async {
    StorageReference fireBaseStorageRef =
        FirebaseStorage.instance.ref().child('pet-images/Tutor:$_tutorId - Pet:$_petId - Img2');
    StorageUploadTask uploadTask = fireBaseStorageRef.putFile(File(pathImg2));

    StorageTaskSnapshot imgUpload = await uploadTask.onComplete;
    String imgLink = await imgUpload.ref.getDownloadURL();
    String res = await uploadThirdPicture(pathImg3, _tutorId, _petId);
    return res;
  }

  Future uploadThirdPicture(String pathImg3, _tutorId, _petId) async {
    StorageReference fireBaseStorageRef =
        FirebaseStorage.instance.ref().child('pet-images/Tutor:$_tutorId - Pet:$_petId - Img3');
    StorageUploadTask uploadTask = fireBaseStorageRef.putFile(File(pathImg3));

    StorageTaskSnapshot imgUpload = await uploadTask.onComplete;
    String imgLink = await imgUpload.ref.getDownloadURL();
    return 'complete';
  }
}
