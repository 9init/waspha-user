import 'package:intl/intl.dart';

String formatDateFromString(String inputDate) {
  DateTime dateTime = DateTime.parse(inputDate);

  // Format as "d/M/yyyy"
  String formattedDate = DateFormat('d/M/yyyy').format(dateTime);

  return formattedDate;
}

String formatDate(DateTime inputDate) {
  // Format as "d/M/yyyy"
  String formattedDate = DateFormat('d/M/yyyy').format(inputDate);

  return formattedDate;
}

String formatTimeFromString(String inputDate) {
  DateTime dateTime = DateTime.parse(inputDate);

  // Format as "h:mm a"
  String formattedTime = DateFormat('h:mm a').format(dateTime);

  return formattedTime;
}

String formatTime(DateTime inputDate) {
  // Format as "h:mm a"
  String formattedTime = DateFormat('h:mm a').format(inputDate);

  return formattedTime;
}
