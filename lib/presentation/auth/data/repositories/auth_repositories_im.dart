import 'package:social_app/presentation/auth/data/data_source/auth_remote_data_source.dart';
import 'package:social_app/presentation/auth/data/repositories/auth_repositories.dart';
import 'package:social_app/presentation/auth/domain/entities/app_users.dart';

class AuthRepositoriesIm implements AuthRepositories {
  AuthDataSource authDataSource;

  AuthRepositoriesIm({required this.authDataSource});

  @override
  Future<AppUsers> login(String email, String password) async {
    return await authDataSource.login(email, password);
  }

  @override
  Future<AppUsers> register(String name, String email, String password) async {
    return await authDataSource.register(name, email, password);
  }


}
