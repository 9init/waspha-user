import 'package:waspha/src/models/loading_state/loading_state.dart';
import 'package:waspha/src/models/password_change/password_change_model.dart';
import 'package:waspha/src/models/phone/phone_model.dart';
import 'package:waspha/src/shared/networking/networking.dart';
import 'package:waspha/src/shared/networking/results.dart';

class PasswordResetRepository {
  static Future<bool> requestResetPasswordWithPhoneNumber(
      PhoneModel phone) async {
    final result = await Networking.post("/forget-password", {
      "vendor_id": {
        "country_code": phone.countryCode,
        "number": phone.number,
        "phone_number": phone.phoneNumber,
      },
    });

    return switch (result) {
      Success() => true,
      Failure() => false,
      Error() => false,
    };
  }

  static Future<bool> requestResetPasswordWithEmail(String email) async {
    final result = await Networking.post("/forget-password", {
      "vendor_id": email,
    });

    return switch (result) {
      Success() => true,
      Failure() => false,
      Error() => false,
    };
  }

  static Future<String?> verifyOtpForPhone(PhoneModel phone, int otp) async {
    final result = await Networking.post("/verify-reset-password", {
      "vendor_id": {
        "country_code": phone.countryCode,
        "phone_number": phone.phoneNumber,
        "number": phone.number,
      },
      "otp": otp,
    });

    return switch (result) {
      Success(value: final value) => value.data["data"]["reset_code"],
      Failure() => null,
      Error() => false,
    };
  }

  static Future<String?> verifyOtpForEmail(String email, int otp) async {
    final result = await Networking.post("/verify-reset-password", {
      "vendor_id": email,
      "otp": otp,
    });

    return switch (result) {
      Success(value: final value) => value.data["data"]["reset_code"],
      Failure() => null,
      Error() => null,
    };
  }

  static Future<PasswordChangeModel> resetPassword(
      String resetCode, String password) async {
    final result = await Networking.post("/reset-password", {
      "reset_code": resetCode,
      "password": password,
    });
    return switch (result) {
      Success(value: final value) => PasswordChangeModel.fromJson(value.data),
      Failure(failure: final failure) =>
        PasswordChangeModel.fromJson(failure.response!.data),
      Error() => const PasswordChangeModel(
          message: "something went wrong", state: LoadingState.error),
    };
  }
}
