import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:responsive_chat_app/module/home/model/chat_room.dart';

part 'chat_rooms_state.dart';
part 'chat_rooms_cubit.freezed.dart';

class ChatRoomsCubit extends Cubit<ChatRoomsState> {
  ChatRoomsCubit() : super(const ChatRoomsState());

  void selectRoom(ChatRoom room) {
    emit(state.copyWith(selectedChatRoom: room));
  }

  void unSelectRoom() {
    emit(state.copyWith(selectedChatRoom: null));
  }
}
