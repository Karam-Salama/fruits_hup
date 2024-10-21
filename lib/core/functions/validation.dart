// validation.dart

import 'package:email_validator/email_validator.dart';

class Validation {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    return null;
  }

  /// Validates the email format.
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'هذا الحقل مطلوب';
    } else if (!EmailValidator.validate(value)) {
      return 'من فضلك ادخل بريد الكتروني صحيح';
    }
    return null;
  }

  /// Validates the password to ensure it meets specific criteria.
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'هذا الحقل مطلوب';
    } else if (value.length <= 8) {
      return 'لا يمكن ان يكون كلمة المرور اقل من 8 حروف';
    } else if (!RegExp(r'^(?=.*[A-Z])').hasMatch(value)) {
      return 'يجب ان تحتوي كلمة المرور على حرف كبير على الاقل';
    }
    return null;
  }
}
