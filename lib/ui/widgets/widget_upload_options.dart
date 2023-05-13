import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../core/colors.dart';
import '../../core/text_style.dart';

class UploadOptionChooser extends StatelessWidget {
  final String guid;
  final Function(String) onTap;
  final ImagePicker pickedFile = ImagePicker();

  UploadOptionChooser({Key? key, required this.guid, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorSystem.instance.card),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Choose an option",
                style: TextSystem.instance.normal(ColorSystem.instance.gradientStart),
              ),
            ),
            const Divider(),
            ListTile(
              leading: Icon(Icons.camera_enhance_outlined, color: ColorSystem.instance.text),
              title: Text(
                "Camera",
                style: TextSystem.instance.normal(ColorSystem.instance.text),
              ),
              onTap: () async {
                
                if (await askForPermission(ImageSource.camera)) {
                  final XFile? path = await pickedFile.pickImage(source: ImageSource.camera);
                  if (path != null) {
                    onTap(path.path);
                  }
                  if(context.mounted){
                  Navigator.of(context).pop();
                }}
              },
            ),
            ListTile(
              leading: Icon(Icons.wallpaper_outlined, color: ColorSystem.instance.text),
              title: Text(
                "Gallery",
                style: TextSystem.instance.normal(ColorSystem.instance.gradientStart),
              ),
              onTap: () async {
                if (await askForPermission(ImageSource.gallery)) {
                  final XFile? path = await pickedFile.pickImage(source: ImageSource.gallery);

                  if (path != null) {
                    onTap(path.path);
                  }
                  if(context.mounted){
                  Navigator.of(context).pop();
                }
                }
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Future<String?> pickImage(ImageSource source) async {
    final XFile? file = await ImagePicker().pickImage(
      source: source,
      maxHeight: 512,
      maxWidth: 512,
    );
    return file?.path;
  }

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
