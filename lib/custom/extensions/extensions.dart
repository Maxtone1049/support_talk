import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wepay/custom/app_values.dart';
import 'package:wepay/custom/toast_services.dart';

extension StringExtension on String {
  List<String> get searchList {
    List<String> result = [];

    void generateCombinations(int start, String current) {
      if (current.length >= 3) {
        result.add(current.toLowerCase());
      }
      for (int i = start; i < length; i++) {
        generateCombinations(i + 1, current + this[i]);
      }
    }

    for (int i = 0; i < length; i++) {
      generateCombinations(i + 1, this[i].toString());
    }

    return result;
  }

  List<String> get progressiveList {
    List<String> result = [];
    for (int i = 1; i <= length; i++) {
      result.add(substring(0, i).toLowerCase());
    }
    return result;
  }

  String get capitalize {
    if (isEmpty) return this;
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String get camelCasePhrase {
    if (isEmpty) return this;
    List<String> commonWords = [
      "and",
      "or",
      "a",
      "an",
      "the",
      "in",
      "on",
      "at",
    ];
    List<String> words = split(" ");
    List<String> capitalizedWords =
        words.mapIndexed((index, word) {
          if (index == 0 || !commonWords.contains(word.toLowerCase())) {
            return word.capitalize;
          } else {
            return word;
          }
        }).toList();
    return capitalizedWords.join(" ");
  }

  List<String> get splitByNairaSign =>
      split(nairaSign).insertBetweenElements(nairaSign)
        ..removeWhere((e) => e.isEmpty);

  String get formatPhoneNumber {
    var phone = trim().replaceAll(' ', '');
    if (phone.startsWith('+234')) {
      return phone;
    } else if (phone.startsWith('234')) {
      return '+$phone';
    } else if (phone.startsWith('0')) {
      return '+234${phone.substring(1)}';
    } else {
      return '+234$phone';
    }
  }

  String? get titleFromHTML {
    RegExp titleRegex = RegExp(r'<title>(.*?)</title>');

    RegExpMatch? match = titleRegex.firstMatch(this);

    if (match != null) {
      String title = match.group(1)!;

      title = title.replaceAllMapped(RegExp(r'&#?\w+;'), (match) {
        var entity = match.group(0);
        switch (entity) {
          case '&amp;':
            return '&';
          case '&lt;':
            return '<';
          case '&gt;':
            return '>';
          case '&quot;':
            return '"';
          case '&apos;':
            return "'";
          // Add more replacements as needed
          default:
            return entity!;
        }
      });

      return title;
    } else {
      return null;
    }
  }
}

extension NullableExtensions<E> on List<E>? {
  E? get nullableFirst {
    if (this == null || this?.isEmpty == true) {
      return null;
    } else {
      return this!.first;
    }
  }

  E? get nullableLast {
    if (this == null || this?.isEmpty == true) {
      return null;
    } else {
      return this!.last;
    }
  }

  bool isEveryItemPresent(List<E>? b) {
    if (this == null) {
      return b == null;
    }

    if (b == null || this?.length != b.length) {
      return false;
    }

    for (var item in b) {
      if (this?.contains(item) == false) return false;
    }
    return true;
  }
}

extension Unique<E, Id> on List<E> {
  List<E> unique([Id Function(E element)? id]) {
    var ids = <dynamic>{};
    var list = List<E>.from(this);
    list.retainWhere((x) => ids.add(id != null ? id(x) : x as Id));
    return list;
  }

  List<List<E>> chunk([int size = 3]) {
    List<List<E>> chunks = [];
    for (var i = 0; i < length; i += size) {
      var end = (i + size < length) ? i + size : length;
      chunks.add(sublist(i, end));
    }
    return chunks;
  }

  Iterable<T> mapIndexed<T>(T Function(int index, E element) f) sync* {
    var index = 0;
    for (var element in this) {
      yield f(index, element);
      index++;
    }
  }

  bool isItemPresent(List<E> list2) {
    for (var item in list2) {
      if (contains(item)) return true;
    }
    return false;
  }

  int repeatingIndexOf(E e, [int count = 10]) {
    var index = indexOf(e);
    var max = (index / count).floor();

    var repeatingIndex = index - (10 * max);
    return repeatingIndex;
  }

  List<E> insertBetweenElements(E elementToInsert) {
    if (isEmpty) return [];

    List<E> resultList = [];

    for (int i = 0; i < length - 1; i++) {
      resultList.add(this[i]);
      resultList.add(elementToInsert);
    }

    resultList.add(last);

    return resultList;
  }

  E? nullableFirstWhere(bool Function(E e) test) {
    try {
      var e = firstWhere(test);
      return e;
    } catch (e) {
      return null;
    }
  }

  E? nullableLastWhere(bool Function(E e) test) {
    try {
      var e = lastWhere(test);
      return e;
    } catch (e) {
      return null;
    }
  }

  List<List<E>> groupBy(String Function(E element) id) {
    List<List<E>> groupedLists = [];

    for (E element in this) {
      String key = id(element);
      bool found = false;

      for (int i = 0; i < groupedLists.length; i++) {
        if (groupedLists[i].isNotEmpty && id(groupedLists[i].first) == key) {
          groupedLists[i].add(element);
          found = true;
          break;
        }
      }

      if (!found) {
        groupedLists.add([element]);
      }
    }

    return groupedLists;
  }
}

extension NumExtensions on num? {
  String get numberFormat => numberFormatter.format(this ?? 0);

  String formatCount(String singular, [String? plural]) {
    var value = this ?? 0;
    if (value == 1) {
      return '1 $singular';
    } else {
      return '${compactNumberFormatter.format(value)} ${plural ?? '${singular}s'}';
    }
  }

  List<Icon> ratingStars() {
    var rating = this ?? 0;
    var ratingAsInt = rating.toInt();
    var color = const Color(0xffFFCC4D);
    List<Icon> list = [
      ...List<Icon>.generate(
        ratingAsInt,
        (index) => Icon(Icons.star_rounded, color: color, size: 36),
      ),
      ...List<Icon>.generate(
        5 - ratingAsInt,
        (index) => Icon(Icons.star_border_rounded, color: color, size: 36),
      ),
    ];
    if (rating - ratingAsInt >= 0.5) {
      list.insert(
        ratingAsInt,
        Icon(Icons.star_half_rounded, color: color, size: 36),
      );
      list.removeLast();
    }

    return list;
  }
}

extension UsefulExtensions<T> on Future<T?> {
  Future<T?> tryCatch({Function(dynamic)? onError, returnValue}) async {
    try {
      return await this;
    } catch (e) {
      if (onError == null) {
        ToastService.showErrorToast(message: e.toString());
      } else {
        onError(e);
      }
      return returnValue;
    }
  }

  Future<T?> wrapWithLoader({
    Function(dynamic)? onError,
    returnValue,
    String? message,
  }) async {
    try {
      //  showFullScreenDialog(true, message);
      var value = await this;
      // showFullScreenDialog(false);
      return value;
    } catch (e) {
      //  showFullScreenDialog(false);
      if (onError == null) {
        ToastService.showErrorToast(message: e.toString());
      } else {
        onError(e);
      }
      return returnValue;
    }
  }
}

extension DateExtensions on DateTime? {
  String timeAgo() {
    if (this == null) {
      return 'now';
    }
    var elapsed =
        DateTime.now().millisecondsSinceEpoch - this!.millisecondsSinceEpoch;

    var seconds = elapsed / 1000;
    var minutes = seconds / 60;
    var hours = minutes / 60;
    var days = hours / 24;
    var months = days / 30;
    var years = days / 365;

    String value = '';

    if (seconds < 45) {
      value = "now";
    } else if (seconds < 90) {
      value = '1 minute ago';
    } else if (minutes < 45) {
      value = '${minutes.round()} minutes ago ';
    } else if (minutes < 90) {
      value = '1 hour ago';
    } else if (hours < 24) {
      value = '${hours.round()} hours ago ';
    } else if (hours < 48) {
      value = '1 day ago';
    } else if (days < 30) {
      value = '${days.round()} days ago';
    } else if (days < 60) {
      value = '1 month ago ';
    } else if (days < 365) {
      value = '${months.round()} months ago ';
    } else if (years < 2) {
      value = '1 year ago';
    } else {
      value = '${years.round()} years ago';
    }

    return value;
  }

  String timeLeft() {
    if (this == null) {
      return 'now';
    }
    var elapsed =
        this!.millisecondsSinceEpoch - DateTime.now().millisecondsSinceEpoch;

    var seconds = elapsed / 1000;
    var minutes = seconds / 60;
    var hours = minutes / 60;
    var days = hours / 24;
    var months = days / 30;
    var years = days / 365;

    String value = '';

    if (seconds < 60) {
      value = seconds.floor().formatCount('second');
    } else if (minutes < 60) {
      value = minutes.floor().formatCount('minute');
    } else if (hours < 24) {
      value = hours.floor().formatCount('hour');
    } else if (days < 30) {
      value = days.floor().formatCount('day');
    } else if (months < 12) {
      value = months.floor().formatCount('month');
    } else {
      value = years.floor().formatCount('year');
    }

    return value;
  }

  String get kJMFormat => this == null ? '' : kDateFormatJM.format(this!);

  String get kEEEMMMdFormat =>
      this == null ? '' : kDateFormatEEEMMMd.format(this!);
  String get kMMMdhmmaFormat =>
      this == null ? '' : kDateFormatMMMdhmma.format(this!);
  String get kEdMhmmaFormat =>
      this == null ? '' : kDateFormatEdMhmma.format(this!);

  String get kMMMEEFormat => this == null ? '' : kDateFormatMMMEE.format(this!);

  String? get formatDOB {
    if (this == null) return null;

    return '${this!.month}/${this!.day}/${this!.year}';
  }
}

extension DurationFormatting on Duration {
  String get formatDuration {
    if (isNegative) {
      return "0s";
    }

    String hoursPart =
        (inHours > 0)
            ? '${inHours}h${(inMinutes.remainder(60) > 0) ? ' ' : ''}'
            : '';

    String minutesPart =
        (inMinutes.remainder(60) > 0)
            ? '${inMinutes.remainder(60)}m${(inSeconds.remainder(60) > 0) ? ' ' : ''}'
            : '';

    String secondsPart =
        (inSeconds.remainder(60) > 0) ? '${inSeconds.remainder(60)}s' : '';

    return '$hoursPart$minutesPart$secondsPart';
  }
}

class FunctionUtils {
  static Future<T?> tryCatch<T>(
    Future<T?> Function() func, {
    Function(dynamic)? onError,
    int? maxRetries,
    dynamic returnValue,
  }) {
    if (maxRetries != null) {
      return _retry(
        function: () => func().tryCatch(onError: onError ?? (_) {}),
        count: maxRetries,
        returnValue: returnValue,
      );
    } else {
      return func().tryCatch(returnValue: returnValue, onError: onError);
    }
  }

  static Future<T?> _retry<T>({
    required Future<T?> Function() function,
    int? count,
    dynamic returnValue,
  }) async {
    int retryCount = 0;
    int maxRetries = count ?? double.maxFinite.toInt();
    while (retryCount < maxRetries) {
      try {
        var value = await function();
        if (value == null) {
          retryCount++;
        } else {
          return value;
        }
      } catch (e) {
        retryCount++;
      }
    }
    return returnValue;
  }

  // static Future<T?> _tryCatch<T>({
  //   required Future<T?> Function() function,
  //   Function(dynamic)? onError,
  //   dynamic returnValue,
  // }) async {
  //   try {
  //     return await function();
  //   } catch (e) {
  //     if (onError == null) {
  //       ToastService.showErrorToast(message: e.toString());
  //     } else {
  //       onError(e);
  //     }
  //     return returnValue;
  //   }
  // }

  static Future<T?> wrapWithLoader<T>(
    Future<T?> Function() func, {
    Function(dynamic)? onError,
    bool retry = false,
    bool tryCatch = true,
    int? maxRetries,
    dynamic returnValue,
  }) async {
    // showFullScreenDialog(true);
    T? response;
    if (retry) {
      response = await _retry(
        function: () => func().tryCatch(onError: onError ?? (_) {}),
        count: maxRetries,
        returnValue: returnValue,
      );
    } else if (tryCatch) {
      response = await func().tryCatch(
        returnValue: returnValue,
        onError: onError,
      );
    } else {
      response = await func();
    }

    // showFullScreenDialog(false);

    return response;
  }
}

// extension ReviewExtensions on List<ReviewModel>? {
//   num get averageRating {
//     if ((this ?? []).where((e) => e.confirmed == true).isEmpty) return 0;
//     var ratings = (this ?? [])
//         .where((e) => e.confirmed == true)
//         .map((e) => e.rating ?? 0);

//     return (ratings.fold<num>(0, (p, e) => p + e)) / (ratings.length);
//   }

//   List<ReviewModel> get excellent =>
//       (this ?? [])
//           .where((e) => e.confirmed == true)
//           .where((e) => e.rating == 5)
//           .toList();

//   List<ReviewModel> get great =>
//       (this ?? [])
//           .where((e) => e.confirmed == true)
//           .where((e) => e.rating == 4)
//           .toList();

//   List<ReviewModel> get good =>
//       (this ?? [])
//           .where((e) => e.confirmed == true)
//           .where((e) => e.rating == 3)
//           .toList();

//   List<ReviewModel> get average =>
//       (this ?? [])
//           .where((e) => e.confirmed == true)
//           .where((e) => e.rating == 2)
//           .toList();

//   List<ReviewModel> get fair =>
//       (this ?? [])
//           .where((e) => e.confirmed == true)
//           .where((e) => e.rating == 1)
//           .toList();
// }

// extension VMExtensions on BaseViewModel {
//   Future<T?> toggleBusy<T>(Future<T?> Function() callback) async {
//     if (isBusy) return null;
//     setBusy(true);
//     var response = await callback();
//     setBusy(false);

//     return response;
//   }
// }

// class _DocumentReferenceHandler<T extends Object> {
//   final DocumentReference _reference;

//   _DocumentReferenceHandler(this._reference);

//   DocumentReference<UserModel> userModelConverter() =>
//       _reference.withConverter<UserModel>(
//         fromFirestore: (a, b) => UserModel.fromJson(a.data() ?? {}),
//         toFirestore: (a, b) => a.toJson(),
//       );

//   DocumentReference<BookingModel> bookingModelConverter() =>
//       _reference.withConverter<BookingModel>(
//         fromFirestore: (a, b) => BookingModel.fromJson(a.data() ?? {}),
//         toFirestore: (a, b) => a.toJson(),
//       );

//   DocumentReference<Conversation> conversationConverter() =>
//       _reference.withConverter<Conversation>(
//           fromFirestore: (a, b) => Conversation.fromMap(a.data() ?? {}),
//           toFirestore: (a, b) => a.toMap());

//   DocumentReference<BannerModel> bannerConverter() =>
//       _reference.withConverter<BannerModel>(
//         fromFirestore: (a, b) => BannerModel.fromMap(a.data() ?? {}),
//         toFirestore: (a, b) => a.toMap(),
//       );

//   DocumentReference<Message> messageConverter() =>
//       _reference.withConverter<Message>(
//         fromFirestore: (a, b) => Message.fromMap(a.data() ?? {}),
//         toFirestore: (a, b) => a.toMap(),
//       );
//   DocumentReference<TransactionModel> transactionConverter() =>
//       _reference.withConverter<TransactionModel>(
//         fromFirestore: (a, b) => TransactionModel.fromMap(a.data() ?? {}),
//         toFirestore: (a, b) => a.toMap(),
//       );
// }

// class _QueryHandler<T extends Object> {
//   final Query<T> _reference;

//   _QueryHandler(this._reference);

//   Query<UserModel> userModelConverter() => _reference.withConverter<UserModel>(
//         fromFirestore: (a, b) => UserModel.fromJson(a.data() ?? {}),
//         toFirestore: (a, b) => a.toJson(),
//       );

//   // Query<BookingModel> bookingModelConverter() =>
//   //     _reference.withConverter<BookingModel>(
//   //       fromFirestore: (a, b) => BookingModel.fromJson(a.data() ?? {}),
//   //       toFirestore: (a, b) => a.toJson(),
//   //     );

//   Query<Conversation> conversationConverter() =>
//       _reference.withConverter<Conversation>(
//           fromFirestore: (a, b) => Conversation.fromMap(a.data() ?? {}),
//           toFirestore: (a, b) => a.toMap());

//   Query<BannerModel> bannerConverter() => _reference.withConverter<BannerModel>(
//         fromFirestore: (a, b) => BannerModel.fromMap(a.data() ?? {}),
//         toFirestore: (a, b) => a.toMap(),
//       );

//   Query<Message> messageConverter() => _reference.withConverter<Message>(
//         fromFirestore: (a, b) => Message.fromMap(a.data() ?? {}),
//         toFirestore: (a, b) => a.toMap(),
//       );
//   Query<TransactionModel> transactionConverter() =>
//       _reference.withConverter<TransactionModel>(
//         fromFirestore: (a, b) => TransactionModel.fromMap(a.data() ?? {}),
//         toFirestore: (a, b) => a.toMap(),
//       );
// }

// extension DocumentReferenceExtensions on DocumentReference {
//   _DocumentReferenceHandler get _handler => _DocumentReferenceHandler(this);

//   DocumentReference<UserModel> withUserConverter() =>
//       _handler.userModelConverter();

//   DocumentReference<BookingModel> withBookingConverter() =>
//       _handler.bookingModelConverter();

//   DocumentReference<Conversation> withConversationConverter() =>
//       _handler.conversationConverter();

//   DocumentReference<BannerModel> withBannerConverter() =>
//       _handler.bannerConverter();

//   DocumentReference<Message> withMessageConverter() =>
//       _handler.messageConverter();

//   DocumentReference<TransactionModel> withTransactionConverterConverter() =>
//       _handler.transactionConverter();
// }

// extension QueryExtensions<T extends Object> on Query<T> {
//   _QueryHandler get _handler => _QueryHandler(this);

//   Query<UserModel> withUserConverter() => _handler.userModelConverter();

//   Query<BookingModel> withBookingConverter() =>
//       _handler.bookingModelConverter();

//   Query<Conversation> withConversationConverter() =>
//       _handler.conversationConverter();

//   Query<BannerModel> withBannerConverter() => _handler.bannerConverter();

//   Query<Message> withMessageConverter() => _handler.messageConverter();

//   Query<TransactionModel> withTransactionConverter() =>
//       _handler.transactionConverter();
// }
