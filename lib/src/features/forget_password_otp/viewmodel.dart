import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:waspha/src/features/forget_password/viewmodel.dart';
import 'package:waspha/src/models/loading_state/loading_state.dart';
import 'package:waspha/src/repository/auth/password_reset.dart';

class OtpVerificationNotifier extends StateNotifier<LoadingState> {
  OtpVerificationNotifier() : super(LoadingState.initial);

  String _enteredOtp = ''; // Keep track of entered OTP within the notifier
  String? _followUpCode;

  String get enteredOtp => _enteredOtp;
  String? get followUpCode => _followUpCode;

  // Function to set the entered OTP
  void setEnteredOtp(String otp) {
    _enteredOtp = otp;
  }

  Future<void> verifyOtp(PasswordResetModel passResetModel) async {
    _followUpCode = null;
    state = LoadingState.loading;

    final resetCode = passResetModel.selectedOption == ResetOption.EMAIL
        ? await PasswordResetRepository.verifyOtpForEmail(
            passResetModel.email!, int.parse(enteredOtp))
        : await PasswordResetRepository.verifyOtpForPhone(
            passResetModel.phoneNumber!, int.parse(enteredOtp));

    if (resetCode != null) {
      // Optionally, you can update the model here or notify a listener
      // For example, you can use _enteredOtp or call another method to handle further logic
      _followUpCode = resetCode;
      debugPrint('reset code is $resetCode');
      state = LoadingState.success;
    } else {
      state = LoadingState.error;
    }
  }
}

final otpVerificationNotifier =
    StateNotifierProvider<OtpVerificationNotifier, LoadingState>((ref) {
  return OtpVerificationNotifier();
});
