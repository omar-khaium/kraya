import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
class Helper{
  Future<bool> askForPermission(ImageSource source) async {
    PermissionStatus status;
    if (source == ImageSource.camera) {
      status = await (source == ImageSource.camera
          ? Permission.camera
          : Platform.isIOS
          ? Permission.photos
          : Permission.storage)
          .request();
    } else {
      status = await (source == ImageSource.gallery
          ? Permission.storage
          : Platform.isIOS
          ? Permission.photos
          : Permission.storage)
          .request();
    }

    return status.isGranted || status.isLimited;
  }
}
