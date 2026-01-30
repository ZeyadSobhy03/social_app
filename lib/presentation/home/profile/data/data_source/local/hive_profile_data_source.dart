import 'package:hive/hive.dart';
import 'package:social_app/presentation/home/profile/domain/entities/profile_user_adapter.dart';

import 'local_profile_data_source.dart';

class HiveProfileDataSource implements LocalProfileDataSource {
  @override
  Future<void> cacheUserProfile(
    String userId,
    ProfileUserAdapter profileData,
  ) async {
    final box = Hive.box<ProfileUserAdapter>('profileBox');
    await box.put(userId, profileData);
  }

  @override
  Future<ProfileUserAdapter> getCachedUserProfile(String userId) async {
    final box = Hive.box<ProfileUserAdapter>('profileBox');
    final data = box.get(userId);
    if (data != null) {
      return data;
    } else {
      throw Exception('No cached profile found for userId: $userId');
    }
  }

  @override
  Future<void> updateUserProfile(
    String userId,
    ProfileUserAdapter profileData,
  ) async {
    final box = Hive.box<ProfileUserAdapter>('profileBox');
    await box.put(userId, profileData);
  }

  // Implement Hive local data source methods here
}
