part of 'chat_rooms_cubit.dart';

@freezed
class ChatRoomsState with _$ChatRoomsState {
  const factory ChatRoomsState({
    ChatRoom? selectedChatRoom,
  }) = _ChatRoomsState;
}
