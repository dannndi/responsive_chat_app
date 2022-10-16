// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'chat_rooms_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChatRoomsState {
  ChatRoom? get selectedChatRoom => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChatRoomsStateCopyWith<ChatRoomsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomsStateCopyWith<$Res> {
  factory $ChatRoomsStateCopyWith(
          ChatRoomsState value, $Res Function(ChatRoomsState) then) =
      _$ChatRoomsStateCopyWithImpl<$Res, ChatRoomsState>;
  @useResult
  $Res call({ChatRoom? selectedChatRoom});
}

/// @nodoc
class _$ChatRoomsStateCopyWithImpl<$Res, $Val extends ChatRoomsState>
    implements $ChatRoomsStateCopyWith<$Res> {
  _$ChatRoomsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedChatRoom = freezed,
  }) {
    return _then(_value.copyWith(
      selectedChatRoom: freezed == selectedChatRoom
          ? _value.selectedChatRoom
          : selectedChatRoom // ignore: cast_nullable_to_non_nullable
              as ChatRoom?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatRoomsStateCopyWith<$Res>
    implements $ChatRoomsStateCopyWith<$Res> {
  factory _$$_ChatRoomsStateCopyWith(
          _$_ChatRoomsState value, $Res Function(_$_ChatRoomsState) then) =
      __$$_ChatRoomsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ChatRoom? selectedChatRoom});
}

/// @nodoc
class __$$_ChatRoomsStateCopyWithImpl<$Res>
    extends _$ChatRoomsStateCopyWithImpl<$Res, _$_ChatRoomsState>
    implements _$$_ChatRoomsStateCopyWith<$Res> {
  __$$_ChatRoomsStateCopyWithImpl(
      _$_ChatRoomsState _value, $Res Function(_$_ChatRoomsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedChatRoom = freezed,
  }) {
    return _then(_$_ChatRoomsState(
      selectedChatRoom: freezed == selectedChatRoom
          ? _value.selectedChatRoom
          : selectedChatRoom // ignore: cast_nullable_to_non_nullable
              as ChatRoom?,
    ));
  }
}

/// @nodoc

class _$_ChatRoomsState implements _ChatRoomsState {
  const _$_ChatRoomsState({this.selectedChatRoom});

  @override
  final ChatRoom? selectedChatRoom;

  @override
  String toString() {
    return 'ChatRoomsState(selectedChatRoom: $selectedChatRoom)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatRoomsState &&
            (identical(other.selectedChatRoom, selectedChatRoom) ||
                other.selectedChatRoom == selectedChatRoom));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedChatRoom);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatRoomsStateCopyWith<_$_ChatRoomsState> get copyWith =>
      __$$_ChatRoomsStateCopyWithImpl<_$_ChatRoomsState>(this, _$identity);
}

abstract class _ChatRoomsState implements ChatRoomsState {
  const factory _ChatRoomsState({final ChatRoom? selectedChatRoom}) =
      _$_ChatRoomsState;

  @override
  ChatRoom? get selectedChatRoom;
  @override
  @JsonKey(ignore: true)
  _$$_ChatRoomsStateCopyWith<_$_ChatRoomsState> get copyWith =>
      throw _privateConstructorUsedError;
}
