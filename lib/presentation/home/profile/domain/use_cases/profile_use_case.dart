import 'package:social_app/presentation/home/profile/data/repositories/profile_repositories.dart';

import '../entities/profile_user.dart';

class ProfileUseCase {
  // Add your use case methods here

  ProfileRepositories profileRepositories;

  ProfileUseCase({required this.profileRepositories});

  Future<ProfileUser> fetchUserProfile(String userId) async {
    return await profileRepositories.fetchUserProfile(userId);
  }

  Future<void> updateUserProfile(String userId, ProfileUser profileData) async {
    return await profileRepositories.updateUserProfile(userId, profileData);
  }
}
