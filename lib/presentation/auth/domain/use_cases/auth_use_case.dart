import 'package:social_app/presentation/auth/data/repositories/auth_repositories.dart';

import '../entities/app_users.dart';

class AuthUseCase {
  AuthRepositories authRepositories;

  AuthUseCase({required this.authRepositories});

  Future<AppUsers> login(String email, String password) async {
    return await authRepositories.login(email, password);
  }

  Future<AppUsers> register(String name, String email, String password) async {
    return await authRepositories.register(name, email, password);
  }
}
