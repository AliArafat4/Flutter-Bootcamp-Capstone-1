import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_hack/bloc/profile_bloc/profile_bloc.dart';
import 'package:team_hack/screens/profile/widgets/personal_info.dart';
import 'package:team_hack/screens/profile/widgets/profile_image.dart';

class PartOneImage extends StatelessWidget {
  const PartOneImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfileImage(
          image: "assets/images/proofile_image.jpg",
        ),
        const SizedBox(
          height: 8,
        ),
        BlocBuilder<ProfileBloc, ProfileState>(
          buildWhen: (previous, current) => current is GetCurrentUserState,
          builder: (context, state) {
            return PersonalInfo(
              name: state is GetCurrentUserState ? "${state.user.name}" : "...",
              email:
                  state is GetCurrentUserState ? "${state.user.email}" : "...",
            );
          },
        ),
      ],
    );
  }
}
