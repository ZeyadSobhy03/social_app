import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_app/presentation/auth/data/data_source/auth_remote_data_source.dart';
import 'package:social_app/presentation/auth/domain/entities/app_users.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseDataSource implements AuthDataSource {
  @override
  Future<AppUsers> login(String email, String password) async {
    UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    final user = credential.user;
    return AppUsers(
      id: user!.uid,
      name: user.displayName ?? '',
      email: user.email!,
    );
  }

  @override
  Future<AppUsers> register(String name, String email, String password) async {
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    final user = credential.user;

    // Update the display name
    await user!.updateDisplayName(name);

    return saveUserToFireStore(
      AppUsers(id: user.uid, name: name, email: email),
    );
  }

  @override
  Future<AppUsers> getCurrentUser() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return AppUsers(
        id: user.uid,
        name: user.displayName ?? '',
        email: user.email!,
      );
    } else {
      throw Exception('No user is currently signed in.');
    }
  }

  @override
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<AppUsers> saveUserToFireStore(AppUsers appUsers) async {
    final db = FirebaseFirestore.instance;
   await db.collection('users').doc(appUsers.id).set({
      'name': appUsers.name,
      'email': appUsers.email,
      'id': appUsers.id,
    });
    return appUsers;
  }

  // Implementation details would go here
}
