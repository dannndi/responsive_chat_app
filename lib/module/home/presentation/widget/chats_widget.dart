import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_chat_app/core/extension/date_time_extension.dart';
import 'package:responsive_chat_app/core/theme/app_color.dart';
import 'package:responsive_chat_app/module/home/model/chat_room.dart';
import 'package:responsive_chat_app/module/home/presentation/cubit/chat_rooms_cubit.dart';

class ChatsWidget extends StatelessWidget {
  const ChatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Theme.of(context).dividerColor,
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Messages",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  CupertinoIcons.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: BlocBuilder<ChatRoomsCubit, ChatRoomsState>(
            builder: (context, state) {
              return ListView.separated(
                padding: const EdgeInsets.only(bottom: 24),
                itemCount: dummyChatRoom.length,
                separatorBuilder: (_, __) => const Divider(
                  height: 1,
                ),
                itemBuilder: (context, index) {
                  return ChatRoomItem(
                    room: dummyChatRoom[index],
                    isSelected: state.selectedChatRoom == dummyChatRoom[index],
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }
}

class ChatRoomItem extends StatelessWidget {
  const ChatRoomItem({
    super.key,
    required this.room,
    required this.isSelected,
  });

  final ChatRoom room;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<ChatRoomsCubit>().selectRoom(room);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primaryColor.withOpacity(0.05) : null,
        ),
        foregroundDecoration: BoxDecoration(
          border: isSelected
              ? Border(
                  left: BorderSide(
                    color: AppColor.primaryColor,
                    width: 4,
                  ),
                )
              : null,
        ),
        child: Row(
          children: [
            Visibility(
              visible: room.hasUnreadMessage,
              maintainState: true,
              maintainAnimation: true,
              maintainSize: true,
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 48,
                        width: 48,
                        child: Stack(
                          children: [
                            Container(
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                    room.picture,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            if (room.isOnline)
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  height: 12,
                                  width: 12,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.green,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              room.name,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                            const SizedBox(height: 6),
                            Text(
                              room.username,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        room.lastMessageTimestamp.toTimeFormat,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    room.lastMessage,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.grey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
