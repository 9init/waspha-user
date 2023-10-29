import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/utils/dio_helper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/user_data.dart';

part 'profile_domain.g.dart';

final getProfileDataProvider =
    FutureProvider.family<UserData, BuildContext>((ref, context) async {
  final url = "user/profile";

  try {
    final response = await ref.watch(dioProvider).get(url);
    if (response.statusCode == 403) {
      context.go("/guest_screen");
      return UserData();
    }
    final data = response.data["data"];
    return UserData.fromJson(data);
  } catch (e) {
    log("Profile Error: ${e}");
  }
  return UserData();
});

final signedOutProvider =
    FutureProvider.family((ref, BuildContext context) async {
  final url = "user/logout";
  try {
    final response =
        await ref.watch(dioProvider).post(url, {}, deleteCookie: true);
    if (response.statusCode == 200) {
      context.go("/login");
    }
  } on DioError {}
});

final deleteAccountProvider =
    FutureProvider.family((ref, BuildContext context) async {
  final url = "user/delete";
  try {
    final response = await ref.watch(dioProvider).post(url, {});
    if (response.statusCode == 200) {
      context.go('/');
    }
  } on DioError catch (e) {
    print("DELETE ACCOUNT ERROR ${e.response?.data}");
    if (e.response?.statusCode == 403) {
      return false;
    }
  }
});

@riverpod
Future<bool> editProfile(Ref ref,
    {required String userName,
    required String dob,
    String language = "en",
    String gender = "male",
    required BuildContext context}) async {
  final String url = "user/edit-profile";
  try {
    final request = await ref.watch(dioProvider).post(url, {
      "name": userName,
      "dob": dob,
      "gender": gender,
      "language": language,
    });
    // final data = request.data["data"];

    if (request.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Profile Updated"),
      ));
      return true;
    }
  } catch (e) {
    log("EDIT PROFILE ERROR ${e}");
  }
  return false;
}

final updateImageProvider =
    FutureProvider.family<bool, String>((ref, filePath) async {
  final String url = 'user/edit-avatar';

  try {
    FormData formdata = FormData.fromMap({
      "file": await MultipartFile.fromFile(filePath),
    });
    final request = await ref.watch(dioProvider).post(url, formdata);
    print(request);
    if (request.statusCode == 200) {
      return true;
    }
  } catch (e) {}
  return false;
});

final changeLanguageProvider =
    FutureProvider.family<bool, String>((ref, languageCode) async {
  final String url = 'user/change-language';
  try {
    final request = await ref.watch(dioProvider).post(url, {
      'language': languageCode,
    });
    if (request.statusCode == 200) {
      return true;
    }
  } catch (e) {}
  return false;
});
