import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/bloc/user_profie/user_profile_bloc.dart';
import '../../../resources/my_assets/my_assets.dart';

class BlurBackgroundProfileImageWidget extends StatelessWidget {
  const BlurBackgroundProfileImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserProfileBloc, UserProfileState>(
      builder: (context, userProfileState) {
        final String userProfileImage =
            userProfileState.profileImageFilePath;
        return ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.amber,
                image: userProfileImage.isNotEmpty
                    ? DecorationImage(
                    image: FileImage(
                      File(userProfileImage),
                    ),
                    fit: BoxFit.cover)
                    : const DecorationImage(
                    image: AssetImage(
                      MyAssets.userDefaultProfileImage,
                    ),
                    fit: BoxFit.cover)),
          ),
        );
      },
    );
  }
}