import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_chat_app/core/theme/app_color.dart';
import 'package:responsive_chat_app/core/theme/cubit/theme_cubit.dart';

class MobileHeader extends StatelessWidget {
  const MobileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage(
              "assets/messenger.png",
            ),
            width: 32,
            height: 32,
          ),
          const Expanded(child: SizedBox()),
          IconButton(
            onPressed: () {},
            splashRadius: 20,
            icon: const Icon(
              Icons.search,
              size: 20,
            ),
          ),
          const SizedBox(width: 8),
          PopupMenuButton(
            tooltip: "Profile Menu",
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Row(
                    children: [
                      const Icon(Icons.notifications_outlined),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 32),
                        child: Text(
                          "Notification",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      )
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      const Icon(Icons.person_outline),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 32),
                        child: Text(
                          "Profile",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      )
                    ],
                  ),
                ),
                PopupMenuItem(
                  onTap: () {
                    final theme = context.read<ThemeCubit>().state.themeMode;

                    context.read<ThemeCubit>().changeThemeMode(
                        theme == ThemeMode.light
                            ? ThemeMode.dark
                            : ThemeMode.light);
                  },
                  child: Row(
                    children: [
                      Icon(context.read<ThemeCubit>().state.themeMode ==
                              ThemeMode.dark
                          ? Icons.light_mode_outlined
                          : Icons.dark_mode_outlined),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 32),
                        child: Text(
                          context.read<ThemeCubit>().state.themeMode ==
                                  ThemeMode.dark
                              ? "Light Mode"
                              : "Dark Mode",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      )
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      const Icon(Icons.settings_outlined),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 32),
                        child: Text(
                          "Settings",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      )
                    ],
                  ),
                ),
                PopupMenuItem(
                  child: Row(
                    children: [
                      Icon(Icons.logout_outlined, color: AppColor.red),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 32),
                        child: Text(
                          "Logout",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: AppColor.red),
                        ),
                      )
                    ],
                  ),
                ),
              ];
            },
            position: PopupMenuPosition.under,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                border: Border.all(),
                shape: BoxShape.circle,
                image: const DecorationImage(
                  image: AssetImage(
                    "assets/profile.jpg",
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
