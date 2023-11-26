import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:waspha/src/models/phone/phone_model.dart';
import 'package:waspha/src/repository/auth/password_reset.dart';

enum ResetOption {
  // ignore: constant_identifier_names
  EMAIL(0), // Default value is 0
  // ignore: constant_identifier_names
  PHONE(1); // Default value is 1

  const ResetOption(this.value);
  final int value;
}

class PasswordResetModel {
  String? email;
  PhoneModel? phoneNumber;
  ResetOption selectedOption = ResetOption.EMAIL; // Use the enum type

  bool get isValid => selectedOption == ResetOption.EMAIL
      ? email != null && email!.isNotEmpty
      : phoneNumber != null;

  String? get value =>
      selectedOption == ResetOption.EMAIL ? email : phoneNumber?.phoneNumber;

  PasswordResetModel copyWith({
    String? email,
    PhoneModel? phoneNumber,
    ResetOption? selectedOption,
  }) {
    return PasswordResetModel()
      ..email = email ?? this.email
      ..phoneNumber = phoneNumber ?? this.phoneNumber
      ..selectedOption = selectedOption ?? this.selectedOption;
  }
}

// ViewModel extending StateNotifier with PasswordResetModel as state
class PasswordResetViewModel extends StateNotifier<PasswordResetModel> {
  PasswordResetViewModel() : super(PasswordResetModel());

  // Update email field
  void updateEmail(String? email) {
    state = state.copyWith(email: email, phoneNumber: null);
  }

  // Update phone number field
  void updatePhoneNumber(PhoneModel? phoneNumber) {
    state = state.copyWith(phoneNumber: phoneNumber, email: null);
  }

  void updateSelectedOption(ResetOption option) {
    state = state.copyWith(selectedOption: option);
  }

  // Request password reset logic
  Future<void> requestResetPassword() async {
    // Check if either email or phone number is present
    if (!state.isValid) return;

    state.selectedOption == ResetOption.EMAIL
        ? await PasswordResetRepository.requestResetPasswordWithEmail(
            state.email!)
        : await PasswordResetRepository.requestResetPasswordWithPhoneNumber(
            state.phoneNumber!);
  }
}

// Finally, we are using StateNotifierProvider to allow the UI to interact with
// our PasswordResetViewModel class.
final passwordResetViewModelProvider =
    StateNotifierProvider<PasswordResetViewModel, PasswordResetModel>((ref) {
  return PasswordResetViewModel();
});
