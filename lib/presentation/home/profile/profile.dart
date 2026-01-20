import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/core/routes/routes_manger.dart';
import 'package:social_app/core/widgets/custom_text.dart';
import 'package:social_app/presentation/auth/presentation/view_model/auth_view_model.dart';
import 'package:social_app/presentation/home/profile/presentation/view_model/profile_view_model.dart';
import 'package:social_app/presentation/home/profile/presentation/widgets/bio_box.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late AuthCubit authCubit;
  late ProfileCubit profileCubit;

  final String userId = FirebaseAuth.instance.currentUser?.uid ?? '';

  @override
  void initState() {
    super.initState();

    authCubit = context.read<AuthCubit>();
    profileCubit = context.read<ProfileCubit>();

    if (userId.isNotEmpty) {
      profileCubit.fetchUserProfile(userId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileSuccess) {
              return CustomText(text: state.profileUser.name);
            }
            return const CustomText(text: 'Profile');
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                RouteManger.editProfile,
                arguments: profileCubit.state is ProfileSuccess
                    ? (profileCubit.state as ProfileSuccess).profileUser
                    : null,
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: CustomText(text: state.errorMessage)),
            );
          }
        },
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ProfileSuccess) {
              final user = state.profileUser;

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(child: CustomText(text: ' ${user.email}')),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2),
                    ),
                    child: Center(child: Icon(Icons.account_circle, size: 100)),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: REdgeInsets.all(8.0),
                    child: CustomText(text: 'Bio'),
                  ),

                  Padding(
                    padding: REdgeInsets.all(8.0),
                    child: BioBox(text: ' ${user.bio}'),
                  ),
                ],
              );
            }

            return const Center(child: CustomText(text: 'No Profile Data'));
          },
        ),
      ),
    );
  }
}
