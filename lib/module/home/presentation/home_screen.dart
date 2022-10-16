import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_chat_app/core/component/widgets/responsive_screen.dart';
import 'package:responsive_chat_app/module/home/presentation/cubit/chat_rooms_cubit.dart';
import 'package:responsive_chat_app/module/home/presentation/widget/chat_room_widget.dart';
import 'package:responsive_chat_app/module/home/presentation/widget/chats_widget.dart';
import 'package:responsive_chat_app/module/home/presentation/widget/desktop/desktop_header.dart';
import 'package:responsive_chat_app/module/home/presentation/widget/mobile/mobile_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ResponsiveScreen(
        mobile: MobileLayout(),
        tablet: DesktopLayout(),
        dekstop: DesktopLayout(),
      ),
    );
  }
}

class MobileLayout extends StatelessWidget {
  const MobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatRoomsCubit, ChatRoomsState>(
      builder: (context, state) {
        if (state.selectedChatRoom != null) {
          return const ChatRoomWidget(showBackButton: true);
        }

        return Column(
          children: const [
            MobileHeader(),
            Expanded(
              child: ChatsWidget(),
            ),
          ],
        );
      },
    );
  }
}

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DesktopHeader(),
        Padding(
          padding: const EdgeInsets.only(top: 24, left: 24),
          child: Text(
            "All Messages",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Theme.of(context).dividerColor,
              ),
            ),
            child: Row(
              children: const [
                Expanded(
                  flex: 3,
                  child: ChatsWidget(),
                ),
                VerticalDivider(),
                Expanded(
                  flex: 7,
                  child: ChatRoomWidget(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
