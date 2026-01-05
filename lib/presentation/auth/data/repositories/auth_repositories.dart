import '../../domain/entities/app_users.dart';

abstract class AuthRepositories {
  Future<AppUsers> login(String email, String password);
  Future<AppUsers> register(String name, String email, String password);
}