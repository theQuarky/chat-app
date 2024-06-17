import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

Future<UserCredential> signInWithFacebook() async {
  try {
    final LoginResult loginResult =
        await FacebookAuth.instance.login(permissions: [
      'email',
      'public_profile',
      'user_birthday',
      'user_age_range',
      'user_gender',
      'user_photos'
    ]);

    if (loginResult.status == LoginStatus.success) {
      final AccessToken accessToken = loginResult.accessToken!;
      final OAuthCredential credential =
          FacebookAuthProvider.credential(accessToken.tokenString);
      print('Logged in access token: ${accessToken}');
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } else {
      throw FirebaseAuthException(
        code: 'Facebook Login Failed',
        message: 'The Facebook login was not successful.',
      );
    }
  } on FirebaseAuthException catch (e) {
    // Handle Firebase authentication exceptions
    print('Firebase Auth Exception: ${e.message}');
    throw e; // rethrow the exception
  } catch (e) {
    // Handle other exceptions
    print('Other Exception: $e');
    throw e; // rethrow the exception
  }
}
