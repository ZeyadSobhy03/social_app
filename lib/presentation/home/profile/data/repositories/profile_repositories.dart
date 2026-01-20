import '../../domain/entities/profile_user.dart';

abstract class ProfileRepositories {
  Future<ProfileUser> fetchUserProfile(String userId);
  Future<void> updateUserProfile(String userId, ProfileUser profileData);
}