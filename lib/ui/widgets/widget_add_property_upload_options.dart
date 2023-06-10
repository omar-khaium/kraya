import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kraya/core/helper.dart';

import '../../core/colors.dart';
import '../../core/text_style.dart';

class UploadAddPropertyOptionChooser extends StatelessWidget {
  final String guid;
  final Function(File) onTap;
  final ImagePicker pickedFile = ImagePicker();

  UploadAddPropertyOptionChooser({Key? key, required this.guid, required this.onTap}) : super(key: key);

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
                if (await Helper().askForPermission(ImageSource.camera)) {
                  final XFile? path = await pickedFile.pickImage(source: ImageSource.camera);
                  if (path != null) {
                    onTap(File(path.path));
                  }
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                }
              },
            ),
            ListTile(
              leading: Icon(Icons.wallpaper_outlined, color: ColorSystem.instance.text),
              title: Text(
                "Gallery",
                style: TextSystem.instance.normal(ColorSystem.instance.gradientStart),
              ),
              onTap: () async {
                if (await Helper().askForPermission(ImageSource.gallery)) {
                  final XFile? path = await pickedFile.pickImage(source: ImageSource.gallery);
                  if (path != null) {
                    onTap(File(path.path));
                  }
                  if (context.mounted) {
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


}
