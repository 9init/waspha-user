import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/shared/networking/networking.dart';
import 'package:waspha/src/shared/networking/results.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/user_data.dart';

part 'profile_domain.g.dart';

final getProfileDataProvider =
    FutureProvider.family<UserData, BuildContext>((ref, context) async {
  final url = "/profile";
  final result = await Networking.get(url);
  switch (result) {
    case Success(value: final value):
      final data = value.data["data"];
      return UserData.fromJson(data);
    case Failure():
      context.go("/guest_screen");
      return UserData();
    case Error():
      return UserData();
  }
});

final signedOutProvider =
    FutureProvider.family((ref, BuildContext context) async {
  final url = "/logout";
  final result = await Networking.post(url, {});

  switch (result) {
    case Success():
      try {
        await Networking.deleteCookies();
      } catch (_) {}
      context.go("/login");
      break;
    case Failure():
    case Error():
      break;
  }
});

final deleteAccountProvider =
    FutureProvider.family((ref, BuildContext context) async {
  final url = "/delete";
  final result = await Networking.post(url, {});

  switch (result) {
    case Success():
      context.go("/");
      break;
    case Failure():
      return false;
    case Error():
      break;
  }
});

@riverpod
Future<bool> editProfile(Ref ref,
    {required String userName,
    required String dob,
    String language = "en",
    String gender = "male",
    required BuildContext context}) async {
  final String url = "/edit-profile";
  final result = await Networking.post(url, {
    "name": userName,
    "dob": dob,
    "gender": gender,
    "language": language,
  });

  switch (result) {
    case Success():
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Profile Updated"),
      ));
      return true;
    case Failure(failure: final f):
      debugPrint("EDIT PROFILE ERROR ${f.message}");
      return false;
    case Error(exception: final e):
      debugPrint("EDIT PROFILE ERROR ${e}");
      return false;
  }
}

final updateImageProvider =
    FutureProvider.family<bool, String>((ref, filePath) async {
  final String url = 'user/edit-avatar';
  FormData formData = FormData.fromMap({
    "file": await MultipartFile.fromFile(filePath),
  });

  final result = await Networking.post(url, formData);
  return switch (result) {
    Success() => true,
    Failure() => false,
    Error() => false,
  };
});

final changeLanguageProvider =
    FutureProvider.family<bool, String>((ref, languageCode) async {
  final String url = '/change-language';

  final result = await Networking.post(url, {'language': languageCode});
  return switch (result) {
    Success() => true,
    Failure() => false,
    Error() => false,
  };
});
