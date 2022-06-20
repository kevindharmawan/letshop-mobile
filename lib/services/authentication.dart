import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:letshop_mobile/shared/misc/_misc.dart';
import 'package:letshop_mobile/utils/constants/firebase_error.dart';
import 'package:letshop_mobile/utils/constants/storage_keys.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class Authentication {
  final _signInKey = StorageKeys.isSignedIn;

  final _box = GetStorage();
  final _googleSignIn = GoogleSignIn();
  final _firebase = FirebaseAuth.instance;

  late GoogleSignInAccount? _googleAccount;
  late AuthorizationCredentialAppleID? _appleAccount;
  late String? _rawNonce;

  Future<String> signUp(String email, String password) async {
    var errorMessage = FirebaseError.doesNotExist;

    try {
      Get.dialog(const Loading());
      await _firebase.createUserWithEmailAndPassword(
          email: email, password: password);
      await _box.write(_signInKey, true);
      // TODO: Create profile
    } on FirebaseAuthException catch (error) {
      errorMessage = _getFirebaseExceptionMessage(error);
    } on PlatformException catch (_) {
      errorMessage = 'error_unexpected'.tr;
    } catch (e) {
      errorMessage = 'error_unexpected'.tr;
    } finally {
      Get.back();
    }
    return errorMessage;
  }

  Future<String> signIn(String email, String password) async {
    var errorMessage = FirebaseError.doesNotExist;

    try {
      Get.dialog(const Loading());
      await _firebase.signInWithEmailAndPassword(
          email: email, password: password);
      await _box.write(_signInKey, true);
    } on FirebaseAuthException catch (error) {
      errorMessage = _getFirebaseExceptionMessage(error);
    } on PlatformException catch (_) {
      errorMessage = 'error_unexpected'.tr;
    } catch (e) {
      errorMessage = 'error_unexpected'.tr;
    } finally {
      Get.back();
    }

    return errorMessage;
  }

  Future<String> signOut() async {
    var errorMessage = FirebaseError.doesNotExist;
    try {
      Get.dialog(const Loading());
      await _firebase.signOut();
      await _googleSignIn.signOut();
      await _box.remove(_signInKey);
      await _box.write(_signInKey, false);
    } on FirebaseAuthException catch (error) {
      errorMessage = _getFirebaseExceptionMessage(error);
    } on PlatformException catch (_) {
      errorMessage = 'error_unexpected'.tr;
    } catch (e) {
      errorMessage = 'error_unexpected'.tr;
    } finally {
      Get.back();
    }

    return errorMessage;
  }

  Future<bool> getGoogleAccount() async {
    _googleAccount = await _googleSignIn.signIn();
    if (_googleAccount == null) {
      return false;
    } else {
      return true;
    }
  }

  Future<String> authWithGoogle(bool isSignUp) async {
    var errorMessage = FirebaseError.doesNotExist;

    try {
      Get.dialog(const Loading());
      var googleAuth = await _googleAccount!.authentication;
      var credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      var authResult = await _firebase.signInWithCredential(credential);
      await _box.write(_signInKey, true);
      if (isSignUp && authResult.user != null) {
        var email = authResult.user!.email;
        var imageUrl = authResult.user!.photoURL;
        // TODO: Create profile
      }
    } on FirebaseAuthException catch (e) {
      errorMessage = _getFirebaseExceptionMessage(e);
      _googleSignIn.signOut();
    } on PlatformException catch (_) {
      errorMessage = 'error_unexpected'.tr;
      _googleSignIn.signOut();
    } catch (e) {
      errorMessage = 'error_unexpected'.tr;
      _googleSignIn.signOut();
    } finally {
      Get.back();
    }

    return errorMessage;
  }

  String _generateRawNonce({int length = 32}) {
    const charset =
        '1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final random = Random.secure();

    String output =
        List.generate(length, (_) => charset[random.nextInt(charset.length)])
            .join();

    return output;
  }

  String _generateNonceSha256(String rawNonce) {
    return sha256.convert(utf8.encode(rawNonce)).toString();
  }

  Future<bool> getAppleAccount() async {
    try {
      _rawNonce = _generateRawNonce();
      var _nonce = _generateNonceSha256(_rawNonce!);

      _appleAccount = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: _nonce,
      );

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String> authWithApple(bool isSignUp) async {
    var errorMessage = FirebaseError.doesNotExist;

    try {
      var credential = OAuthProvider('apple.com').credential(
        idToken: _appleAccount?.identityToken,
        rawNonce: _rawNonce,
      );
      var authResult = await _firebase.signInWithCredential(credential);
      await _box.write(_signInKey, true);
      if (isSignUp && authResult.user != null) {
        var email = authResult.user!.email;
        var imageUrl = authResult.user!.photoURL;
        // TODO: Create profile
      }
    } on FirebaseAuthException catch (e) {
      errorMessage = _getFirebaseExceptionMessage(e);
    } on PlatformException catch (_) {
      errorMessage = 'error_unexpected'.tr;
    } catch (e) {
      errorMessage = 'error_unexpected'.tr;
    } finally {
      Get.back();
    }

    return errorMessage;
  }

  String _getFirebaseExceptionMessage(FirebaseAuthException error) {
    var _errorMessage = '';
    switch (error.code) {
      case FirebaseError.invalidEmail:
        _errorMessage = 'error_invalidEmail';
        break;
      case FirebaseError.emailAlreadyInUse:
        _errorMessage = 'error_emailAlreadyInUse'.tr;
        break;
      case FirebaseError.weakPassword:
        _errorMessage = 'error_weakPassword'.tr;
        break;
      case FirebaseError.wrongPassword:
        _errorMessage = 'error_wrongPassword'.tr;
        break;
      case FirebaseError.userNotFound:
        _errorMessage = 'error_userNotFound'.tr;
        break;
      case FirebaseError.userDisabled:
        _errorMessage = 'error_userDisabled'.tr;
        break;
      case FirebaseError.tooManyRequest:
        _errorMessage = 'error_tooManyRequest'.tr;
        break;
      case FirebaseError.operationNotAllowed:
        _errorMessage = 'error_operationNotAllowed'.tr;
        break;
      case FirebaseError.differentCredential:
        _errorMessage = 'error_differentCredential'.tr;
        break;
      case FirebaseError.invalidCredential:
        _errorMessage = 'error_invalidCredential'.tr;
        break;
      default:
        _errorMessage = 'error_unexpected'.tr;
    }

    return _errorMessage;
  }
}
