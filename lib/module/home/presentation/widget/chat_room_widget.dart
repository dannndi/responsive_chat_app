import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_chat_app/core/extension/date_time_extension.dart';
import 'package:responsive_chat_app/core/theme/app_color.dart';
import 'package:responsive_chat_app/module/home/model/chat_room.dart';
import 'package:responsive_chat_app/module/home/presentation/cubit/chat_rooms_cubit.dart';

class ChatRoomWidget extends StatelessWidget {
  const ChatRoomWidget({
    super.key,
    this.showBackButton = false,
  });

  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<ChatRoomsCubit>().unSelectRoom();
        return true;
      },
      child: Scaffold(
        body: BlocBuilder<ChatRoomsCubit, ChatRoomsState>(
          builder: (context, state) {
            if (state.selectedChatRoom == null) {
              return const Center(
                child: Text("Select a chat to start Messaging!"),
              );
            }
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      if (showBackButton) ...[
                        IconButton(
                          onPressed: () {
                            context.read<ChatRoomsCubit>().unSelectRoom();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 20,
                          ),
                          splashRadius: 20,
                        ),
                        const SizedBox(width: 16),
                      ],
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              state.selectedChatRoom?.picture ?? "",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              state.selectedChatRoom?.name ?? "",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              state.selectedChatRoom?.username ?? "",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 48,
                        child: TextButton.icon(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          icon: Icon(
                            Icons.call_outlined,
                            color: Theme.of(context).textTheme.button?.color,
                          ),
                          label: Text(
                            "Call",
                            style: Theme.of(context).textTheme.button,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      SizedBox(
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: const Text("View Profile"),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    padding: const EdgeInsets.all(24),
                    itemCount: state.selectedChatRoom?.chats.length,
                    itemBuilder: (context, index) {
                      Chat? chat = state.selectedChatRoom?.chats[index];
                      Chat? nextChat;

                      if (index !=
                          (state.selectedChatRoom?.chats.length ?? 0) - 1) {
                        nextChat = state.selectedChatRoom?.chats[index + 1];
                      }

                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          /// time stamp, only show in top of each day
                          if (chat?.messageTimestamp.simpleFormat !=
                              nextChat?.messageTimestamp.simpleFormat)
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                margin: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: AppColor.primaryColor.withOpacity(0.1),
                                ),
                                child: Text(
                                  chat?.messageTimestamp.simpleFormat ?? "",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                            ),

                          if (chat?.senderId == myId)
                            Align(
                              alignment: Alignment.centerRight,
                              child: MyChat(chat: chat),
                            ),

                          if (chat?.senderId != myId)
                            Align(
                              alignment: Alignment.centerLeft,
                              child: OthersChat(chat: chat),
                            ),
                        ],
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Theme.of(context).dividerColor,
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {},
                        splashRadius: 20,
                        icon: const Icon(
                          Icons.emoji_emotions_outlined,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 4),
                      IconButton(
                        onPressed: () {},
                        splashRadius: 20,
                        icon: const Icon(
                          CupertinoIcons.photo,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: TextField(
                          minLines: 1,
                          maxLines: 5,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Message....",
                          ),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      const SizedBox(width: 4),
                      IconButton(
                        onPressed: () {},
                        splashRadius: 20,
                        icon: const Icon(
                          CupertinoIcons.paperplane,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class MyChat extends StatelessWidget {
  const MyChat({super.key, this.chat});

  final Chat? chat;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width / 2,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 8,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(8),
              bottomLeft: Radius.circular(8),
              topLeft: Radius.circular(8),
            ),
            color: AppColor.primaryColor,
          ),
          child: Text(
            chat?.message ?? "",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColor.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8, bottom: 16),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${chat?.messageTimestamp.hour ?? "-"}:${chat?.messageTimestamp.minute ?? "-"}",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.done_all,
                size: 18,
                color: Colors.blue,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class OthersChat extends StatelessWidget {
  const OthersChat({super.key, this.chat});

  final Chat? chat;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width / 2,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          margin: const EdgeInsets.symmetric(
            vertical: 8,
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(8),
              bottomLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            color: AppColor.primaryColor.withOpacity(0.2),
          ),
          child: Text(
            chat?.message ?? "",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8, bottom: 16),
          child: Text(
            "${chat?.messageTimestamp.hour ?? "-"}:${chat?.messageTimestamp.minute ?? "-"}",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
