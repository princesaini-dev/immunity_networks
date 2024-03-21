import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:immunity_networks/data/model/user_profile_data_model.dart';
import 'package:immunity_networks/presentation/base/base_stateful_widget.dart';
import 'package:immunity_networks/presentation/base/common/navigation.dart';
import 'package:immunity_networks/presentation/base/common/user_profile_image_view.dart';
import 'package:immunity_networks/presentation/base/widgets/custom_text_widget.dart';
import 'package:immunity_networks/presentation/resources/assets_manager.dart';
import 'package:immunity_networks/presentation/resources/color_manager.dart';
import 'package:immunity_networks/presentation/resources/routes_manager.dart';
import 'package:immunity_networks/presentation/resources/string_manager.dart';
import 'package:immunity_networks/presentation/ui/profile_tab/bloc/profile_screen_bloc.dart';
import 'package:immunity_networks/presentation/ui/profile_tab/bloc/profile_screen_event.dart';
import 'package:immunity_networks/presentation/ui/profile_tab/bloc/profile_screen_state.dart';
import 'package:immunity_networks/presentation/utills/extentions.dart';

class ProfileScreen extends BaseStatefulWidget {
  const ProfileScreen({super.key});

  @override
  BaseStatefulWidgetState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends BaseStatefulWidgetState<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    _getUserProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteDark,
      body: SafeArea(
          child: BlocConsumer<ProfileScreenBloc, ProfileScreenState>(
        listener: (context, state) {
          hideLoadingIndicator();
          if (state is ProfileScreenStatusLoading) {
            showLoadingIndicator();
          }
        },
        builder: (context, state) {
          if (state is ProfileScreenStatusSuccess) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    _userProfileView(state.userProfileDataModel),
                    const SizedBox(
                      height: 15,
                    ),
                    _userOptionsView(state.userProfileDataModel)
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      )),
    );
  }

  Widget _userOptionsView(UserProfileDataModel userProfileDataModel) {
    return Column(
      children: [
        _optionsItemView(
          StringManager.editProfile,
          AssetsManager.editProfileIconImage,
          () {
            pushNavigation(Routes.editProfileRoute,
                arguments: userProfileDataModel);
          },
        ),
        _optionsItemView(
          StringManager.changePassword,
          AssetsManager.changePasswordIconImage,
          () {},
        ),
        _optionsItemView(
          StringManager.transactionHistory,
          AssetsManager.transactionHistoryIconImage,
          () {},
        ),
        _optionsItemView(
          StringManager.allSessions,
          AssetsManager.transactionHistoryIconImage,
          () {},
        ),
        _optionsItemView(
          StringManager.termsAndConditions,
          AssetsManager.termsConditionsIconImage,
          () {},
        ),
        _optionsItemView(
          StringManager.privacyPolicy,
          AssetsManager.privacyPolicyIconImage,
          () {},
        ),
        _optionsItemView(
          StringManager.logout,
          AssetsManager.logoutIconImage,
          () {
            showLogoutDialog();
          },
        )
      ],
    );
  }

  void showLogoutDialog() {}

  Widget _userProfileView(UserProfileDataModel userProfileDataModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        UserProfileImageView(
          imageSize: 70,
          showEditOption: false,
          imageProvider: CachedNetworkImageProvider(
              userProfileDataModel.userProfile?.photoUrl ?? ''),
          onImageSelect: (selectedImage) {},
        ),
        const SizedBox(
          width: 15,
        ),
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
                text:
                    '${userProfileDataModel.userProfile?.firstName} ${userProfileDataModel.userProfile?.lastName}',
                fontSize: 18,
                color: ColorManager.black,
                fontWeight: FontWeight.bold),
            const SizedBox(
              height: 6,
            ),
            CustomTextWidget(
                text: userProfileDataModel.userProfile?.email ?? '',
                fontSize: 14,
                color: ColorManager.gray,
                fontWeight: FontWeight.w500)
          ],
        ))
      ],
    );
  }

  _getUserProfileData() {
    final loginBloc = BlocProvider.of<ProfileScreenBloc>(context);
    loginBloc.add(ProfileScreenObject());
  }

  Widget _optionsItemView(
      String title, String leadingIcon, ClickListener onClick,
      {Color color = ColorManager.appThemeColor, bool showDivider = true}) {
    return TextButton(
        onPressed: () => onClick(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    leadingIcon,
                    width: 22,
                    height: 22,
                    color: color,
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CustomTextWidget(
                        text: title,
                        fontSize: 15,
                        color: color,
                        fontWeight: FontWeight.w400),
                  ))
                ],
              ),
            ),
            const Divider(
              color: ColorManager.dividerColor,
            )
          ],
        ));
  }
}
