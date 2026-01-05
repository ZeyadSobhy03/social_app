import 'package:social_app/presentation/auth/domain/entities/app_users.dart';

abstract class AuthDataSource {
  Future<AppUsers>login(String email,String password);
  Future<AppUsers>register(String name,String email,String password);

  Future<AppUsers>getCurrentUser();
}