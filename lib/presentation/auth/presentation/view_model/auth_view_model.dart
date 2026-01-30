import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/presentation/auth/domain/entities/app_users.dart';
import 'package:social_app/presentation/home/profile/data/data_source/local/hive_profile_data_source.dart';
import 'package:social_app/presentation/home/profile/domain/entities/profile_user_adapter.dart';

import '../../domain/use_cases/auth_use_case.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthUseCase authUseCase;

  AuthCubit({required this.authUseCase}) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await authUseCase.login(email, password);
      emit(AuthSuccess(user));
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        emit(AuthFailure('No user found for that email.'));
      } else if (error.code == 'wrong-password') {
        emit(AuthFailure('Wrong password provided for that user.'));
      } else {
        emit(AuthFailure(error.message ?? 'An unknown error occurred.'));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> register(String name, String email, String password) async {
    emit(AuthLoading());
    try {
      final user = await authUseCase.register(name, email, password);
     await HiveProfileDataSource().cacheUserProfile(
        user.id,
       ProfileUserAdapter(
          email: email,
          name: name,
          id: user.id,
          bio: '',
          profileImage: 'assets/images/image1.jpg',
        ),
      );
      emit(AuthSuccess(user));
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        emit(AuthFailure('The password provided is too weak.'));
      } else if (error.code == 'email-already-in-use') {
        emit(AuthFailure('The account already exists for that email.'));
      } else {
        emit(AuthFailure(error.message ?? 'An unknown error occurred.'));
      }
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> getCurrentUser() async {
    emit(AuthLoading());
    try {
      final user = await authUseCase.getCurrentUser();
      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }

  Future<void> logout() async {
    try {
      await authUseCase.logout();
      emit(AuthInitial());
    } catch (e) {
      emit(AuthFailure(e.toString()));
    }
  }
}

sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  AppUsers appUsers;

  AuthSuccess(this.appUsers);
}

class AuthFailure extends AuthState {
  String error;

  AuthFailure(this.error);
}
