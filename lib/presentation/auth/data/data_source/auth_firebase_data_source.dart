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

    return AppUsers(
      id: user.uid,
      name: name,
      email: user.email!,
    );
  }

  // Implementation details would go here
}
