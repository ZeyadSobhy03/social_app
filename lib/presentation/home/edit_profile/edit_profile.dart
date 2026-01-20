import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_app/core/widgets/custom_text.dart';
import 'package:social_app/core/widgets/custom_text_form_field.dart';
import 'package:social_app/presentation/home/profile/domain/entities/profile_user.dart';

import '../profile/presentation/view_model/profile_view_model.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key, required this.profileUser});

  final ProfileUser profileUser;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController bioController;
  final _formKey = GlobalKey<FormState>();

  final String userId = FirebaseAuth.instance.currentUser?.uid ?? '';

  @override
  void initState() {
    super.initState();
    bioController = TextEditingController(text: widget.profileUser.bio);
  }

  @override
  void dispose() {
    bioController.dispose();
    super.dispose();
  }

  void updateProfile() {
    if (!_formKey.currentState!.validate()) return;

    final updatedProfileUser = ProfileUser(
      id: widget.profileUser.id,
      name: widget.profileUser.name,
      bio: bioController.text.trim(),
      email: widget.profileUser.email,
      profileImage: widget.profileUser.profileImage,
    );

    context.read<ProfileCubit>().updateUserProfile(userId, updatedProfileUser);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: 'Edit Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                );
              }
              return IconButton(
                icon: const Icon(Icons.check),
                onPressed: updateProfile,
              );
            },
          ),
        ],
      ),
      body: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileSuccess) {
            Fluttertoast.showToast(msg: 'Profile Updated Successfully');
            Navigator.pop(context);
          }

          if (state is ProfileFailure) {
            Fluttertoast.showToast(msg: state.errorMessage);
          }
        },
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Padding(
                padding: REdgeInsets.all(12),
                child: CustomTextFormField(
                  hintText: widget.profileUser.bio,
                  controller: bioController,

                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return 'Bio cannot be empty';
                    }
                    if (text.length > 150) {
                      return 'Bio cannot exceed 150 characters';
                    }
                    if (text == widget.profileUser.bio) {
                      return 'No changes detected';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
