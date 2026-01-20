import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_app/presentation/home/profile/data/data_source/remote_profile_data_source.dart';
import 'package:social_app/presentation/home/profile/domain/entities/profile_user.dart';

class FireBaseProfileDataSource implements RemoteProfileDataSource {
  @override
  Future<ProfileUser> fetchUserProfile(String userId) async {
    final db = FirebaseFirestore.instance;
    final doc = await db.collection('users').doc(userId).get();
    if (doc.exists) {
      return ProfileUser.fromMap(doc.data()!);
    } else {
      throw Exception('User profile not found');
    }
  }

  @override
  Future<void> updateUserProfile(String userId, ProfileUser profileData) async {
    final db = FirebaseFirestore.instance;
    await db.collection('users').doc(userId).update(profileData.toMap());
  }

  // Implementation of Firebase profile data source
}
