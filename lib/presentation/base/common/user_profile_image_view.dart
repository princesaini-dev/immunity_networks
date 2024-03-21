import 'dart:io';

import 'package:flutter/material.dart';
import 'package:immunity_networks/presentation/resources/assets_manager.dart';
import 'package:immunity_networks/presentation/resources/color_manager.dart';
import 'package:immunity_networks/presentation/utills/extentions.dart';
import 'package:immunity_networks/presentation/utills/image_picker.dart';

class UserProfileImageView extends StatelessWidget {
  final double imageSize;
  final bool showEditOption;
  final ImageProvider imageProvider;
  final Function(File) onImageSelect;

  const UserProfileImageView({
    Key? key,
    required this.imageSize,
    required this.showEditOption,
    required this.imageProvider,
    required this.onImageSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: 'user-profile-image',
          child: CircleAvatar(
            radius: imageSize / 2,
            backgroundColor: ColorManager.imagePlaceholder,
            backgroundImage: imageProvider,
          ),
        ),
        Visibility(
          visible: showEditOption,
          child: Positioned(
            bottom: 0,
            right: 0,
            child: Card(
              shadowColor: ColorManager.white,
              color: ColorManager.black,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(imageSize / 2),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  AssetsManager.editProfileIconImage,
                  width: 24,
                  height: 24,
                  color: ColorManager.white,
                ),
              ),
            ).setOnClickListener(() {
              showImagePickerBottomSheet(
                  context, (image) => {onImageSelect(image)});
            }),
          ),
        ),
      ],
    );
    ;
  }
}
