// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:google_sign_in/google_sign_in.dart';

import 'package:my_fome/src/core/constants/google_constant.dart';

import 'social_auth_service.dart';

class GoogleAuthServiceImpl implements SocialAuthService {
  final googleSignIn = GoogleSignIn(clientId: GoogleConstant.clientId);

  @override
  Future<GoogleSignInAccount?> login() async {
    return await googleSignIn.signIn();
  }

  @override
  Future logout() async {
    await googleSignIn.signOut();
    await googleSignIn.disconnect();
  }

}
