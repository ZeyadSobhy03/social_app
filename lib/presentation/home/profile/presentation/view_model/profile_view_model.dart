import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/presentation/home/profile/domain/entities/profile_user.dart';

import '../../domain/use_cases/profile_use_case.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileUseCase profileUseCase;

  ProfileCubit({required this.profileUseCase}) : super(ProfileInitial());

  Future<void> fetchUserProfile(String userId) async {
    emit(ProfileLoading());
    try {
      final profileUser = await profileUseCase.fetchUserProfile(userId);
      emit(ProfileSuccess(profileUser));
    } catch (e) {
      emit(ProfileFailure(e.toString()));
    }
  }

  Future<void> updateUserProfile(String userId, ProfileUser profileData) async {
    emit(ProfileLoading());
    try {
      await profileUseCase.updateUserProfile(userId, profileData);
      final updatedProfileUser = await profileUseCase.fetchUserProfile(userId);
      emit(ProfileSuccess(updatedProfileUser));
    } catch (e) {
      emit(ProfileFailure(e.toString()));
    }
  }
}

sealed class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  ProfileUser profileUser;

  ProfileSuccess(this.profileUser);
}

class ProfileFailure extends ProfileState {
  final String errorMessage;

  ProfileFailure(this.errorMessage);
}
