import 'package:social_app/presentation/home/profile/domain/entities/profile_user_adapter.dart';

abstract class LocalProfileDataSource {
  Future<ProfileUserAdapter> getCachedUserProfile(String userId);

  Future<void> cacheUserProfile(String userId, ProfileUserAdapter profileData);
  Future<void> updateUserProfile(String userId, ProfileUserAdapter profileData);
}
