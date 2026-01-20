import 'package:social_app/presentation/home/profile/data/data_source/remote_profile_data_source.dart';
import 'package:social_app/presentation/home/profile/data/repositories/profile_repositories.dart';
import 'package:social_app/presentation/home/profile/domain/entities/profile_user.dart';

class ProfileRepositoriesImp implements ProfileRepositories {
  RemoteProfileDataSource remoteProfileDataSource;

  ProfileRepositoriesImp({required this.remoteProfileDataSource});

  @override
  Future<ProfileUser> fetchUserProfile(String userId) async {
    return await remoteProfileDataSource.fetchUserProfile(userId);
  }

  @override
  Future<void> updateUserProfile(String userId, ProfileUser profileData) async {
    return await remoteProfileDataSource.updateUserProfile(userId, profileData);
  }

  // Implementation details will go here
}
