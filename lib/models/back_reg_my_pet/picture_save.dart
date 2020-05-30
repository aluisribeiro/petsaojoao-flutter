import 'package:petsaojoao/models/back_reg_my_pet/picture_information.dart';

class Picture {
  save(_initializeControllerFuture, _num, _controller) async {
    try {
      await _initializeControllerFuture;

      if (_num == 1) {
        final path = await PictureInformation().getFirst();

        await PictureInformation().verifyPath(path);

        await _controller.takePicture(path);
      } else if (_num == 2) {
        final path = await PictureInformation().getSecond();

        await PictureInformation().verifyPath(path);

        await _controller.takePicture(path);
      } else if (_num == 3) {
        final path = await PictureInformation().getThird();

        await PictureInformation().verifyPath(path);

        await _controller.takePicture(path);
      }
    } catch (e) {
      print(e);
    }
  }
}