import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:immunity_networks/presentation/resources/string_manager.dart';
import 'package:immunity_networks/presentation/utills/extentions.dart';

Future showImagePickerBottomSheet(
    BuildContext context, Function(File image) onImageSelect) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.photo_library),
            title: const Text(StringManager.chooseFromGallery),
            onTap: () {
              _getFromGallery(context, ImageSource.gallery, (image) {
                if (image == null) {
                  showToast(StringManager.imageNotSelected);
                } else {
                  onImageSelect(File((image)));
                }
              });
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text(StringManager.takeAPhoto),
            onTap: () {
              _getFromGallery(context, ImageSource.camera, (image) {
                if (image == null) {
                  showToast(StringManager.imageNotSelected);
                } else {
                  onImageSelect(File((image)));
                }
              });
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> _getFromGallery(BuildContext context, ImageSource source,
    Function(String? image) onValue) async {
  final ImagePicker picker = ImagePicker();
  if (context.mounted) {
    final XFile? pickedFile = await picker.pickImage(
      source: source,
    );
    onValue(pickedFile?.path);
  }
}
