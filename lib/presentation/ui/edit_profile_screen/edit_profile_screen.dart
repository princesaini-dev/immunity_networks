import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:immunity_networks/data/model/user_profile_data_model.dart';
import 'package:immunity_networks/presentation/base/base_stateful_widget.dart';
import 'package:immunity_networks/presentation/base/common/navigation.dart';
import 'package:immunity_networks/presentation/base/common/user_profile_image_view.dart';
import 'package:immunity_networks/presentation/base/widgets/custom_button_widget.dart';
import 'package:immunity_networks/presentation/base/widgets/custom_edit_text_widget.dart';
import 'package:immunity_networks/presentation/resources/assets_manager.dart';
import 'package:immunity_networks/presentation/resources/color_manager.dart';
import 'package:immunity_networks/presentation/resources/string_manager.dart';
import 'package:immunity_networks/presentation/ui/edit_profile_screen/bloc/edit_profile_screen_bloc.dart';
import 'package:immunity_networks/presentation/ui/edit_profile_screen/bloc/edit_profile_screen_event.dart';
import 'package:immunity_networks/presentation/ui/edit_profile_screen/bloc/edit_profile_screen_state.dart';

class EditProfileScreen extends BaseStatefulWidget {
  final UserProfileDataModel userProfileDataModel;

  const EditProfileScreen({super.key, required this.userProfileDataModel});

  @override
  BaseStatefulWidgetState<EditProfileScreen> createState() =>
      _EditProfileScreenState();
}

class _EditProfileScreenState
    extends BaseStatefulWidgetState<EditProfileScreen> {
  late ImageProvider _imageProvider;
  late TextEditingController _controllerFirstName;
  late TextEditingController _controllerLastName;
  late TextEditingController _controllerEmail;

  @override
  void initState() {
    super.initState();
    var userData = widget.userProfileDataModel.userProfile;
    _controllerFirstName = TextEditingController(text: userData?.firstName);
    _controllerLastName = TextEditingController(text: userData?.lastName);
    _controllerEmail = TextEditingController(text: userData?.email);
    _imageProvider = CachedNetworkImageProvider(userData?.photoUrl ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteDark,
      appBar: AppBar(
        backgroundColor: ColorManager.whiteDark,
      ),
      body: SafeArea(
          child: BlocConsumer<EditProfileScreenBloc,EditProfileScreenState>(
        listener: (context, state) {
          hideLoadingIndicator();
          if (state is EditProfileScreenStatusLoading) {
            showLoadingIndicator();
          } else if (state is EditProfileScreenStatusSuccess) {
            popNavigation();
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UserProfileImageView(
                  imageSize: 150,
                  showEditOption: true,
                  imageProvider: _imageProvider,
                  onImageSelect: (p0) {},
                ),
                const SizedBox(
                  height: 28,
                ),
                CustomEditTextWidget(
                    controller: _controllerFirstName,
                    hint: StringManager.firstName,
                    leadingIcon: AssetsManager.userLogoImage),
                const SizedBox(
                  height: 18,
                ),
                CustomEditTextWidget(
                    controller: _controllerLastName,
                    hint: StringManager.lastName,
                    leadingIcon: AssetsManager.userLogoImage),
                const SizedBox(
                  height: 18,
                ),
                CustomEditTextWidget(
                    controller: _controllerEmail,
                    hint: StringManager.email,
                    leadingIcon: AssetsManager.emailLogoImage),
                const SizedBox(
                  height: 38,
                ),
                CustomButtonWidget(
                    title: StringManager.update,
                    isLoadingIndicator: isLoading,
                    onClickListener: _onProfileUpdate)
              ],
            ),
          );
        },
      )),
    );
  }

  void _onProfileUpdate() {
    final loginBloc = BlocProvider.of<EditProfileScreenBloc>(context);
    loginBloc.add(EditProfileScreenObject(
        firstName: _controllerFirstName.text,
        lastName: _controllerLastName.text,
        email: _controllerEmail.text));
  }
}
