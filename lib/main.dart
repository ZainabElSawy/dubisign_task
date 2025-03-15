import 'package:dubisign/core/utils/app_colors.dart';
import 'package:dubisign/core/utils/init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utils/app_router.dart';
import 'core/utils/service_locator.dart';
import 'core/utils/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (_, child) {
        Styles.init();
        return MaterialApp.router(
          routerConfig: AppRouter.route,
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            appBarTheme: AppBarTheme(backgroundColor: AppColors.whiteColor),
            scaffoldBackgroundColor: AppColors.backgroundColor,
          ),
        );
      },
    );
  }
}
