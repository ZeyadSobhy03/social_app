import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/core/routes/routes_manger.dart';
import 'package:social_app/core/widgets/custom_text.dart';
import 'package:social_app/presentation/auth/presentation/view_model/auth_view_model.dart';
import 'package:social_app/presentation/home/profile/data/data_source/local/hive_profile_data_source.dart';
import 'package:social_app/presentation/home/profile/domain/entities/profile_user_adapter.dart';
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
  String imageUrl = 'assets/images/image1.jpg';
  ProfileUserAdapter? cachedProfileUser;

  final String userId = FirebaseAuth.instance.currentUser?.uid ?? '';

  @override
  void initState() {
    super.initState();

    authCubit = context.read<AuthCubit>();
    profileCubit = context.read<ProfileCubit>();
    getCachedProfile();

    if (userId.isNotEmpty) {
      profileCubit.fetchUserProfile(userId);
    }
  }

  Future<void> getCachedProfile() async {
    final cached = await HiveProfileDataSource().getCachedUserProfile(userId);

    if (!mounted) return;

    setState(() {
      cachedProfileUser = cached;
      if (cachedProfileUser != null && cachedProfileUser!.profileImage.isNotEmpty) {
        imageUrl = cachedProfileUser!.profileImage;
      }
    });

    if (cachedProfileUser != null) {
      log('cached user id: ${cachedProfileUser!.id}');
      log('cached user name: ${cachedProfileUser!.name}');
      log('cached user bio: ${cachedProfileUser!.bio}');
      log('cached user email: ${cachedProfileUser!.email}');
      log('cached user image: ${cachedProfileUser!.profileImage}');
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

                  GestureDetector(
                    onTap: () async {
                      await loadImage();
                    },
                    child: Center(
                      child: imageUrl.contains('data/user/')
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.file(
                                File(imageUrl),
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                imageUrl,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
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

  loadImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final newProfile = ProfileUserAdapter(
        id: userId,
        name: cachedProfileUser?.name ?? '',
        email: cachedProfileUser?.email ?? '',
        bio: cachedProfileUser?.bio ?? '',
        profileImage: image.path,
      );


      await HiveProfileDataSource().updateUserProfile(userId, newProfile);

      if (!mounted) return;


      setState(() {
        cachedProfileUser = newProfile;
        imageUrl = newProfile.profileImage;
      });
    }
  }

}

/*


 Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2),
                    ),
                    child: Center(child: Icon(Icons.account_circle, size: 100)),
                  ),
 */
