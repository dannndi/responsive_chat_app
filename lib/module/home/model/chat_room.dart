/// our id to determine which chat is ours,
/// and which chat is from others
const int myId = 1;

/// chat room model, a model to hold or store our data
class ChatRoom {
  final String name;
  final String username;
  final String picture;

  final bool isOnline;
  final bool hasUnreadMessage;

  final String lastMessage;
  final DateTime lastMessageTimestamp;
  final List<Chat> chats;

  ChatRoom({
    required this.name,
    required this.username,
    required this.picture,
    required this.isOnline,
    required this.hasUnreadMessage,
    required this.lastMessage,
    required this.lastMessageTimestamp,
    required this.chats,
  });
}

/// our chat model
class Chat {
  final int senderId;
  final String senderName;
  final String message;
  final DateTime messageTimestamp;

  Chat({
    required this.senderId,
    required this.senderName,
    required this.message,
    required this.messageTimestamp,
  });
}

/// dummy chat / conversation
final dummyChatRoom = [
  ChatRoom(
    name: "Rosalee",
    username: "@rosalee",
    picture: "assets/portrait_1.jpeg",
    isOnline: true,
    hasUnreadMessage: true,
    lastMessage: "Hey Dandi, could you send the latest doc ?",
    lastMessageTimestamp: DateTime.now(),
    chats: [
      Chat(
        senderId: 2,
        senderName: "Rosalee",
        message: "Hey Dandi, could you send the latest doc ?",
        messageTimestamp: DateTime.now(),
      ),
      Chat(
        senderId: 2,
        senderName: "Rosalee",
        message: "Okey, I will check that first",
        messageTimestamp: DateTime.now().subtract(const Duration(hours: 1)),
      ),
      Chat(
        senderId: 1,
        senderName: "Dannndi",
        message:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet lacus quis facilisis lobortis. Curabitur quam risus, lobortis sit amet augue eget, pulvinar porta turpis. Nam dignissim, neque eget porttitor molestie, neque leo egestas mi, vel efficitur ligula velit ac ante.",
        messageTimestamp: DateTime.now().subtract(const Duration(hours: 2)),
      ),
      Chat(
        senderId: 1,
        senderName: "Dannndi",
        message:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet lacus quis facilisis lobortis. Curabitur quam risus, lobortis sit amet augue eget, pulvinar porta turpis. Nam dignissim, neque eget porttitor molestie, neque leo egestas mi, vel efficitur ligula velit ac ante.",
        messageTimestamp: DateTime.now().subtract(const Duration(days: 1)),
      ),
      Chat(
        senderId: 2,
        senderName: "Rosalee",
        message:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet lacus quis facilisis lobortis. Curabitur quam risus, lobortis sit amet augue eget, pulvinar porta turpis. Nam dignissim, neque eget porttitor molestie, neque leo egestas mi, vel efficitur ligula velit ac ante.",
        messageTimestamp: DateTime.now().subtract(const Duration(days: 1)),
      ),
      Chat(
        senderId: 1,
        senderName: "Dannndi",
        message:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet lacus quis facilisis lobortis. Curabitur quam risus, lobortis sit amet augue eget, pulvinar porta turpis. Nam dignissim, neque eget porttitor molestie, neque leo egestas mi, vel efficitur ligula velit ac ante.",
        messageTimestamp: DateTime.now().subtract(const Duration(days: 1)),
      ),
      Chat(
        senderId: 2,
        senderName: "Rosalee",
        message:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet lacus quis facilisis lobortis. Curabitur quam risus, lobortis sit amet augue eget, pulvinar porta turpis. Nam dignissim, neque eget porttitor molestie, neque leo egestas mi, vel efficitur ligula velit ac ante.",
        messageTimestamp: DateTime.now().subtract(const Duration(days: 2)),
      ),
      Chat(
        senderId: 2,
        senderName: "Rosalee",
        message:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet lacus quis facilisis lobortis. Curabitur quam risus, lobortis sit amet augue eget, pulvinar porta turpis. Nam dignissim, neque eget porttitor molestie, neque leo egestas mi, vel efficitur ligula velit ac ante.",
        messageTimestamp: DateTime.now().subtract(const Duration(days: 2)),
      ),
      Chat(
        senderId: 1,
        senderName: "Dannndi",
        message:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet lacus quis facilisis lobortis. Curabitur quam risus, lobortis sit amet augue eget, pulvinar porta turpis. Nam dignissim, neque eget porttitor molestie, neque leo egestas mi, vel efficitur ligula velit ac ante.",
        messageTimestamp: DateTime.now().subtract(const Duration(days: 3)),
      ),
      Chat(
        senderId: 1,
        senderName: "Dannndi",
        message:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet lacus quis facilisis lobortis. Curabitur quam risus, lobortis sit amet augue eget, pulvinar porta turpis. Nam dignissim, neque eget porttitor molestie, neque leo egestas mi, vel efficitur ligula velit ac ante.",
        messageTimestamp: DateTime.now().subtract(const Duration(days: 4)),
      ),
      Chat(
        senderId: 1,
        senderName: "Dannndi",
        message:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet lacus quis facilisis lobortis. Curabitur quam risus, lobortis sit amet augue eget, pulvinar porta turpis. Nam dignissim, neque eget porttitor molestie, neque leo egestas mi, vel efficitur ligula velit ac ante.",
        messageTimestamp: DateTime.now().subtract(const Duration(days: 4)),
      ),
      Chat(
        senderId: 1,
        senderName: "Dannndi",
        message:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet lacus quis facilisis lobortis. Curabitur quam risus, lobortis sit amet augue eget, pulvinar porta turpis. Nam dignissim, neque eget porttitor molestie, neque leo egestas mi, vel efficitur ligula velit ac ante.",
        messageTimestamp: DateTime.now().subtract(const Duration(days: 4)),
      ),
      Chat(
        senderId: 2,
        senderName: "Rosalee",
        message:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet lacus quis facilisis lobortis. Curabitur quam risus, lobortis sit amet augue eget, pulvinar porta turpis. Nam dignissim, neque eget porttitor molestie, neque leo egestas mi, vel efficitur ligula velit ac ante.",
        messageTimestamp: DateTime.now().subtract(const Duration(days: 5)),
      ),
      Chat(
        senderId: 2,
        senderName: "Rosalee",
        message:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam imperdiet lacus quis facilisis lobortis. Curabitur quam risus, lobortis sit amet augue eget, pulvinar porta turpis. Nam dignissim, neque eget porttitor molestie, neque leo egestas mi, vel efficitur ligula velit ac ante.",
        messageTimestamp: DateTime.now().subtract(const Duration(days: 5)),
      ),
    ],
  ),
  ChatRoom(
    name: "Anne Teak",
    username: "@annie",
    picture: "assets/portrait_2.jpeg",
    isOnline: false,
    hasUnreadMessage: false,
    lastMessage: "Hey, amazing work as always.",
    lastMessageTimestamp: DateTime.now().subtract(const Duration(minutes: 10)),
    chats: [
      Chat(
        senderId: 2,
        senderName: "Anne Teak",
        message: "Hey, amazing work as always.",
        messageTimestamp: DateTime.now().subtract(const Duration(minutes: 10)),
      ),
    ],
  ),
  ChatRoom(
    name: "Bea Mine",
    username: "@bemine",
    picture: "assets/portrait_3.jpeg",
    isOnline: true,
    hasUnreadMessage: false,
    lastMessage:
        "I heard on the radio today that they are finally going to start building the new bridge. I think it will last for 2 month so we will sent you to Work From Home for the next 2 month",
    lastMessageTimestamp: DateTime.now().subtract(const Duration(days: 1)),
    chats: [
      Chat(
        senderId: 2,
        senderName: "Bea Mine",
        message:
            "I heard on the radio today that they are finally going to start building the new bridge. I think it will last for 2 month so we will sent you to Work From Home for the next 2 month",
        messageTimestamp: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ],
  ),
  ChatRoom(
    name: "Peter Owt",
    username: "@peter",
    picture: "assets/portrait_4.jpeg",
    isOnline: false,
    hasUnreadMessage: false,
    lastMessage:
        "I heard on the radio today that they are finally going to start building the new bridge.",
    lastMessageTimestamp: DateTime.now().subtract(const Duration(days: 1)),
    chats: [
      Chat(
        senderId: 2,
        senderName: "Peter Owt",
        message:
            "I heard on the radio today that they are finally going to start building the new bridge.",
        messageTimestamp: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ],
  ),
  ChatRoom(
    name: "Chris Anthemum",
    username: "@chris",
    picture: "assets/portrait_5.jpeg",
    isOnline: false,
    hasUnreadMessage: false,
    lastMessage:
        "How about those Reds? Do you think they're going to win tonight?",
    lastMessageTimestamp: DateTime.now().subtract(const Duration(days: 1)),
    chats: [
      Chat(
        senderId: 2,
        senderName: "Chris Anthemum",
        message:
            "How about those Reds? Do you think they're going to win tonight?",
        messageTimestamp: DateTime.now().subtract(const Duration(days: 1)),
      ),
    ],
  ),
  ChatRoom(
    name: "Anne T. Kwayted",
    username: "@anne",
    picture: "assets/portrait_6.jpeg",
    isOnline: false,
    hasUnreadMessage: false,
    lastMessage: "See you Next Weekend",
    lastMessageTimestamp: DateTime.now().subtract(const Duration(days: 3)),
    chats: [
      Chat(
        senderId: 2,
        senderName: "Anne T. Kwayted",
        message: "See you Next Weekend",
        messageTimestamp: DateTime.now().subtract(const Duration(days: 3)),
      ),
    ],
  ),
];
