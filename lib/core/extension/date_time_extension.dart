extension DateTimeExtension on DateTime {
  /// extension variable to show date with time format
  /// eg: just now, 10m ago, 2h ago, 1d ago and 10-10-2022
  String get toTimeFormat {
    try {
      int differenceInMinute = DateTime.now().difference(this).inMinutes;
      int differenceInHour = DateTime.now().difference(this).inHours;
      int differenceInDay = DateTime.now().difference(this).inDays;

      if (differenceInMinute < 2) {
        return "just now";
      } else if (differenceInMinute >= 2 && differenceInMinute < 60) {
        return "${differenceInMinute}m ago";
      } else if (differenceInMinute >= 60 && differenceInMinute < 1440) {
        return "${differenceInHour}h ago";
      } else if (differenceInMinute >= 1440 && differenceInMinute < 8640) {
        return "${differenceInDay}d ago";
      } else {
        return "$day-$month-$year";
      }
    } catch (e) {
      return "$day-$month-$year";
    }
  }

  /// extension variable to show date with a simple format
  /// eg : Today, Yesterday, 10-10-2022
  String get simpleFormat {
    final now = DateTime.now();
    final nowformatted = "${now.day}/${now.month}/${now.year}";

    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    final yesterdayformatted =
        "${yesterday.day}/${yesterday.month}/${yesterday.year}";

    final formatted = "$day/$month/$year";

    if (formatted == nowformatted) {
      return "Today";
    }

    if (formatted == yesterdayformatted) {
      return "Yesterday";
    }

    return formatted;
  }
}
