import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:social_app/presentation/auth/data/data_source/auth_firebase_data_source.dart';
import 'package:social_app/presentation/auth/data/repositories/auth_repositories_im.dart';
import 'package:social_app/presentation/auth/domain/use_cases/auth_use_case.dart';
import 'package:social_app/presentation/auth/presentation/view_model/auth_view_model.dart';
import 'package:social_app/presentation/home/profile/data/data_source/fire_base_profile_data_source.dart';
import 'package:social_app/presentation/home/profile/data/repositories/profile_repositories_imp.dart';
import 'package:social_app/presentation/home/profile/domain/use_cases/profile_use_case.dart';
import 'package:social_app/presentation/home/profile/presentation/view_model/profile_view_model.dart';
import 'package:social_app/presentation/social_app.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await ScreenUtil.ensureScreenSize();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(
            authUseCase: AuthUseCase(
              authRepositories: AuthRepositoriesIm(
                authDataSource: AuthFirebaseDataSource(),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(
            profileUseCase: ProfileUseCase(
              profileRepositories: ProfileRepositoriesImp(
                remoteProfileDataSource: FireBaseProfileDataSource(),
              ),
            ),
          ),
        ),
      ],
      child: const SocialApp(),
    ),
  );
}
