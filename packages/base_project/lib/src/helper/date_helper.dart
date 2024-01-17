// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'package:base_project/src/base_project.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// month->days.
Map<int, int> MONTH_DAY = {
  1: 31,
  2: 28,
  3: 31,
  4: 30,
  5: 31,
  6: 30,
  7: 31,
  8: 31,
  9: 30,
  10: 31,
  11: 30,
  12: 31,
};

class DateTimeHelper {
  /// format DateTime.
  /// time            time string.
  /// format          DateFormat type.
  /// dateSeparate    date separate.
  /// timeSeparate    time separate.
  static String formatDateTime(String time, DateFormats format,
      {String? dateSeparate, String? timeSeparate}) {
    switch (format) {
      case DateFormats.NORMAL: //yyyy-MM-dd HH:mm:ss
        time = time.substring(0, "yyyy-MM-dd HH:mm:ss".length);
        break;
      case DateFormats.YEAR_MONTH_DAY_HOUR_MINUTE: //yyyy-MM-dd HH:mm
        time = time.substring(0, "yyyy-MM-dd HH:mm".length);
        break;
      case DateFormats.YEAR_MONTH_DAY: //yyyy-MM-dd
        time = time.substring(0, "yyyy-MM-dd".length);
        break;
      case DateFormats.YEAR_MONTH: //yyyy-MM
        time = time.substring(0, "yyyy-MM".length);
        break;
      case DateFormats.MONTH_DAY: //MM-dd
        time = time.substring("yyyy-".length, "yyyy-MM-dd".length);
        break;
      case DateFormats.MONTH_DAY_HOUR_MINUTE: //MM-dd HH:mm
        time = time.substring("yyyy-".length, "yyyy-MM-dd HH:mm".length);
        break;
      case DateFormats.HOUR_MINUTE_SECOND: //HH:mm:ss
        time =
            time.substring("yyyy-MM-dd ".length, "yyyy-MM-dd HH:mm:ss".length);
        break;
      case DateFormats.HOUR_MINUTE: //HH:mm
        time = time.substring("yyyy-MM-dd ".length, "yyyy-MM-dd HH:mm".length);
        break;
      case DateFormats.dd_MM_YYYY: //dd-MM-yyyy
        final DateFormat formatter = DateFormat('dd-MM-yyyy');
        DateTime d = DateTime.parse(time);
        return formatter.format(d);
      case DateFormats.dd_MM_YYYY2: //dd-MM-yyyy
        final DateFormat formatter = DateFormat('dd/MM/yyyy');
        DateTime d = DateTime.parse(time);
        return formatter.format(d);
      default:
        break;
    }
    time = dateTimeSeparate(time, dateSeparate, timeSeparate);
    return time;
  }

  /// get DateTime By DateStr.
  static DateTime getDateTime(String dateStr) {
    DateTime dateTime = DateTime.tryParse(dateStr)!;
    return dateTime;
  }

  /// get DateTime By Milliseconds.
  static DateTime getDateTimeByMilliseconds(int milliseconds,
      {bool isUtc = false}) {
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: isUtc);
    return dateTime;
  }

  /// get DateMilliseconds By DateStr.
  static int? getDateMillisecondsByTimeStr(String dateStr) {
    DateTime? dateTime = DateTime.tryParse(dateStr);
    return dateTime?.millisecondsSinceEpoch;
  }

  /// get Now Date Milliseconds.
  static int getNowDateMilliseconds() {
    return DateTime.now().millisecondsSinceEpoch;
  }

  /// get Now Date Microseconds.
  static int getNowDateMicroseconds() {
    return DateTime.now().microsecondsSinceEpoch;
  }

  /// get Now Date Str.(yyyy-MM-dd HH:mm:ss)
  static String getNowDateStr() {
    return getDateStrByDateTime(DateTime.now());
  }

  /// get DateStr By DateStr.
  /// dateStr         date String.
  /// format          DateFormat type.
  /// dateSeparate    date separate.
  /// timeSeparate    time separate.
  static String getDateStrByTimeStr(
    String dateStr, {
    DateFormats format = DateFormats.DEFAULT,
    String? dateSeparate,
    String? timeSeparate,
  }) {
    return getDateStrByDateTime(getDateTime(dateStr),
        format: format, dateSeparate: dateSeparate, timeSeparate: timeSeparate);
  }

  /// get DateStr By Milliseconds.
  /// milliseconds    milliseconds.
  /// format          DateFormat type.
  /// dateSeparate    date separate.
  /// timeSeparate    time separate.
  static String getDateStrByMillisecond(int milliseconds,
      {DateFormats format = DateFormats.NORMAL,
      String? dateSeparate,
      String? timeSeparate,
      bool isUtc = false}) {
    DateTime dateTime = getDateTimeByMilliseconds(milliseconds, isUtc: isUtc);
    return getDateStrByDateTime(dateTime,
        format: format,
        dateSeparate: dateSeparate!,
        timeSeparate: timeSeparate!);
  }

  /// get DateStr By DateTime.
  /// dateTime        dateTime.
  /// format          DateFormat type.
  /// dateSeparate    date separate.
  /// timeSeparate    time separate.
  static String getDateStrByDateTime(DateTime dateTime,
      {DateFormats format = DateFormats.NORMAL,
      String? dateSeparate,
      String? timeSeparate}) {
    String dateStr = dateTime.toString();
    dateStr = formatDateTime(dateStr, format,
        dateSeparate: dateSeparate, timeSeparate: timeSeparate);
    return dateStr;
  }

  static DateTime getDate(String date,
      {DateFormats format = DateFormats.YYYY_MM_dd,
      String? dateSeparate,
      String? timeSeparate}) {
    try {
      if (format == DateFormats.dd_MM_YYYY) {
        final DateFormat formatter = DateFormat('dd-MM-yyyy');
        return formatter.parse(date);
      } else if (format == DateFormats.dd_MM_YYYY2) {
        final DateFormat formatter = DateFormat('dd/MM/yyyy');
        return formatter.parse(date);
      } else {
        return DateFormat(formatDateTime(date, format,
                dateSeparate: dateSeparate, timeSeparate: timeSeparate))
            .parseUTC(date)
            .toLocal();
      }
    } catch (e) {
      throw FormatException('Characters remaining after date parsing in $date');
    }
  }

  ///Create timeofdate from String
  static TimeOfDay? convertTimeOfDay(String? s) {
    if (s != null) {
      return TimeOfDay(
          hour: int.parse(s.split(":")[0]), minute: int.parse(s.split(":")[1]));
    }
    return null;
  }

  /// date Time Separate.
  static String dateTimeSeparate(
      String time, String? dateSeparate, String? timeSeparate) {
    if (dateSeparate != null) {
      time = time.replaceAll("-", dateSeparate);
    }
    if (timeSeparate != null) {
      time = time.replaceAll(":", timeSeparate);
    }
    return time;
  }

  /// get WeekDay By Milliseconds.
  static String? getWeekDayByMilliseconds(int milliseconds,
      {bool isUtc = false}) {
    DateTime dateTime = getDateTimeByMilliseconds(milliseconds, isUtc: isUtc);
    return getWeekDay(dateTime);
  }

  /// get WeekDay.
  static String? getWeekDay(DateTime? dateTime) {
    if (dateTime == null) return null;
    String? weekday;
    switch (dateTime.weekday) {
      case 1:
        weekday = "Monday";
        break;
      case 2:
        weekday = "Tuesday";
        break;
      case 3:
        weekday = "Wednesday";
        break;
      case 4:
        weekday = "Thursday";
        break;
      case 5:
        weekday = "Friday";
        break;
      case 6:
        weekday = "Saturday";
        break;
      case 7:
        weekday = "Sunday";
        break;
      default:
        break;
    }
    return weekday;
  }

  /// Return whether it is leap year.
  static bool isLeapYearByDateTime(DateTime dateTime) {
    return isLeapYearByYear(dateTime.year);
  }

  /// Return whether it is leap year.
  static bool isLeapYearByYear(int year) {
    return year % 4 == 0 && year % 100 != 0 || year % 400 == 0;
  }

  /// is yesterday by millis.
  /// Was it yesterday?
  static bool isYesterdayByMilliseconds(int millis, int locMillis) {
    return isYesterday(DateTime.fromMillisecondsSinceEpoch(millis),
        DateTime.fromMillisecondsSinceEpoch(locMillis));
  }

  /// is yesterday by dateTime.
  /// Was it yesterday?
  static bool isYesterday(DateTime dateTime, DateTime locDateTime) {
    if (yearIsEqual(dateTime, locDateTime)) {
      int spDay = DateTimeHelper.getDayOfYear(locDateTime) -
          DateTimeHelper.getDayOfYear(dateTime);
      return spDay == 1;
    } else {
      return ((locDateTime.year - dateTime.year == 1) &&
          dateTime.month == 12 &&
          locDateTime.month == 1 &&
          dateTime.day == 31 &&
          locDateTime.day == 1);
    }
  }

  /// get day of year.
  /// In the first days of the year?
  static int getDayOfYearByMilliseconds(int millis) {
    return getDayOfYear(DateTime.fromMillisecondsSinceEpoch(millis));
  }

  /// get day of year.
  /// In the first days of the year?
  static int getDayOfYear(DateTime dateTime) {
    int year = dateTime.year;
    int month = dateTime.month;
    int days = dateTime.day;
    for (int i = 1; i < month; i++) {
      days = days + MONTH_DAY[i]!;
    }
    if (isLeapYearByYear(year) && month > 2) {
      days = days + 1;
    }
    return days;
  }

  /// year is equal.
  /// Is it the same year?
  static bool yearIsEqualByMilliseconds(int millis, int locMillis) {
    return yearIsEqual(DateTime.fromMillisecondsSinceEpoch(millis),
        DateTime.fromMillisecondsSinceEpoch(locMillis));
  }

  /// year is equal.
  /// Is it the same year?
  static bool yearIsEqual(DateTime dateTime, DateTime locDateTime) {
    return dateTime.year == locDateTime.year;
  }

  /// year is today.
  /// Is it today?
  static bool isToday(int milliseconds, {bool isUtc = false}) {
    if (milliseconds == 0) return false;
    DateTime old =
        DateTime.fromMillisecondsSinceEpoch(milliseconds, isUtc: isUtc);
    DateTime now = isUtc ? DateTime.now().toUtc() : DateTime.now().toLocal();
    return old.year == now.year && old.month == now.month && old.day == now.day;
  }

  static DateTime firstDayOfMonth(DateTime month) {
    return DateTime.utc(month.year, month.month, 1, 12);
  }

  static DateTime lastDayOfMonth(DateTime month) {
    final date = month.month < 12
        ? DateTime.utc(month.year, month.month + 1, 1, 12)
        : DateTime.utc(month.year + 1, 1, 1, 12);
    return date.subtract(const Duration(days: 1));
  }

  static String prettyDuration(DateTime dateTime, {bool short = false}) {
    Duration _duration = Duration(
        days: dateTime.day,
        hours: dateTime.hour,
        minutes: dateTime.minute,
        seconds: dateTime.second,
        milliseconds: dateTime.millisecond,
        microseconds: dateTime.microsecond);
    final int microseconds = _duration.inMicroseconds;
    double minutes = microseconds / (1000 * 1000 * 60);
    if (minutes < 0.9) return short ? 'now' : 'just now';
    if (minutes < 1.5) return short ? '1 min ago' : '1 minute ago';
    if (minutes < 59.5) {
      return '${minutes.round()} ${short ? 'min' : 'minutes'} ago';
    }
    double hours = microseconds / (1000 * 1000 * 60 * 60);
    minutes -= hours.truncate() * 60;
    if (hours < 2 && (minutes < 5 || (minutes < 30 && short))) {
      return '1 hour ago';
    }
    if (hours < 2 && !short) return '1 hour ${minutes.truncate()} minutes ago';
    if (hours < 5 && (minutes <= 20 || minutes >= 40)) {
      return '${hours.round()} hours ago';
    }
    if (hours < 5) return '${hours.round()}½ hours ago';
    if (hours < 23) return '${hours.round()} hours ago';
    double days = microseconds / (1000 * 1000 * 60 * 60 * 24);
    hours -= days.truncate() * 24;
    if (days < 1.5) return '1 day ago';
    if (days < 10.5) return '${days.round()} days ago';
    final double weeks = microseconds / (1000 * 1000 * 60 * 60 * 24 * 7);
    days -= weeks.truncate() * 7;
    if (weeks < 1.5) return '1 week ago';
    return '${weeks.round()} weeks ago';
  }

  static String timeAgoSinceDate(
    DateTime dateString, {
    bool numericDates = true,
  }) {
    String _formatDate = DateFormat('dd-MM-yyyy hh:mma').format(dateString);
    DateTime notificationDate =
        DateFormat("dd-MM-yyyy h:mma").parse(_formatDate);
    final date2 = DateTime.now();
    final difference = date2.difference(notificationDate);
    if (difference.inDays > 8) {
      return _formatDate;
    } else if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? 'một tuần trước' : 'tuần trước';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} ngày trước';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? 'một ngày trước' : 'hôm qua';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} giờ trước';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? 'một giờ trước' : 'một giờ trước';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} phút trước';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? 'một phút trước' : 'một phút trước';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} giây trước';
    } else {
      return 'vừa mới';
    }
  }
}
