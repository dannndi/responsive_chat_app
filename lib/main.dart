import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_chat_app/core/theme/cubit/theme_cubit.dart';
import 'package:responsive_chat_app/module/home/presentation/cubit/chat_rooms_cubit.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'core/route/app_route.dart';
import 'core/route/app_route_name.dart';
import 'core/theme/app_theme.dart';

/// Follow me on
/// Youtube : Dannndi
/// IG : dannndi.ig
/// Tiktok : dannndi.tt
///
/// Like & Subscribe
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider<ChatRoomsCubit>(
          create: (context) => ChatRoomsCubit(),
        ),
      ],
      child: Builder(builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Responsive Chat App",
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: context.watch<ThemeCubit>().state.themeMode,
          initialRoute: AppRouteName.home,
          onGenerateRoute: AppRoute.generate,
          builder: (context, child) {
            return ResponsiveWrapper.builder(
              child,
              defaultScale: true,
              breakpoints: const [
                ResponsiveBreakpoint.resize(450, name: MOBILE),
                ResponsiveBreakpoint.resize(800, name: TABLET),
                ResponsiveBreakpoint.resize(1000, name: TABLET),
                ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                ResponsiveBreakpoint.resize(2460, name: "4K"),
              ],
            );
          },
        );
      }),
    );
  }
}
