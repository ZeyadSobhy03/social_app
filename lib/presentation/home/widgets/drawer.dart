import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routes/routes_manger.dart';
import '../../../core/widgets/custom_list_tile.dart';
import '../../auth/presentation/view_model/auth_view_model.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Icon(Icons.person, size: 60.sp),
            SizedBox(height: 30.h),

            CustomListTile(
              title: 'H O M E',
              icon: Icons.home,
              onTap: () {
                Navigator.pushReplacementNamed(context, RouteManger.home);
              },
            ),
            CustomListTile(
              title: 'P R O F I L E',
              icon: Icons.person,
              onTap: () {
                Navigator.pushNamed(context, RouteManger.profile);
              },
            ),
            CustomListTile(
              title: 'S E  A R C H',
              icon: Icons.search,
              onTap: () {},
            ),
            CustomListTile(
              title: 'S E T T I N G S',
              icon: Icons.settings,
              onTap: () {},
            ),
            CustomListTile(
              title: 'L O G O U T',
              icon: Icons.logout,
              onTap: () async {
                await BlocProvider.of<AuthCubit>(context).logout();

                Navigator.pushReplacementNamed(context, RouteManger.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
