import 'package:petsaojoao/models/back_reg_my_pet/picture_info.dart';

pictureSave(_initializeControllerFuture, _num, _controller) async {
  try {
    await _initializeControllerFuture;

    if (_num == 1) {
      final path = await getFirstPic();

      await verifyPicPath(path);

      await _controller.takePicture(path);
    } else if (_num == 2) {
      final path = await getSecondPic();

      await verifyPicPath(path);

      await _controller.takePicture(path);
    } else if (_num == 3) {
      final path = await getThirdPic();

      await verifyPicPath(path);

      await _controller.takePicture(path);
    }
  } catch (e) {
    print(e);
  }
}
