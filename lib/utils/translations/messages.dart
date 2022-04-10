import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'app_name': 'LetShop',
          'example': 'Example Message',
          'error_invalid_email': 'Invalid email address.',
          'error_email_used': 'Email already in use.',
          'error_wrong_password': 'Incorrect password.',
          'error_weak_password': 'Password is not strong enough.',
          'error_user_not_found':
              'Account doesn\'t exist. Please sign up first.',
          'error_user_disabled': 'Account has been disabled.',
          'error_too_many_request': 'Too many requests. Try again later.',
          'error_operation_not_allowed':
              'Authentication method has been disabled.',
          'error_unexpected': 'An unexpected error has occured.',
          'error_different_credential':
              'There already exist an account with the email address asserted by the credential.',
          'error_invalid_credential':
              'The credential is malformed or has expired.',
          'error_empty_field': 'Please enter some text.',
          'error_email_field': 'Please use a valid email address.',
          'error_username_field':
              'Enter a valid username with 8-20 characters.',
        },
        'id': {
          'app_name': 'LetShop',
          'example': 'Contoh Pesan',
          'error_invalid_email': 'Email tidak valid.',
          'error_email_used': 'Email sudah digunakan.',
          'error_wrong_password': 'Password salah.',
          'error_weak_password': 'Password yang digunakan kurang kuat.',
          'error_user_not_found':
              'Akun tidak ditemukan. Harap mendaftar terlebih dahulu.',
          'error_user_disabled': 'Akun sudah dinonaktifkan.',
          'error_too_many_request': 'Too many requests. Try again later.',
          'error_operation_not_allowed':
              'Metode autentikasi sudah dinonaktifkan.',
          'error_unexpected': 'An unexpected error has occured.',
          'error_different_credential':
              'There already exist an account with the email address asserted by the credential.',
          'error_invalid_credential':
              'The credential is malformed or has expired.',
          'error_empty_field': 'Formulir belum diisi.',
          'error_email_field': 'Harap gunakan email yang valid.',
          'error_username_field':
              'Masukkan username yang valid dengan 8-20 karakter.',
        },
      };
}
