import 'package:youtube_clone/core/utils/exports.dart';

final authServiceProvider = Provider((ref) => AuthService(
    firebaseAuth: FirebaseAuth.instance, googleSignIn: GoogleSignIn()));

class AuthService {
  FirebaseAuth firebaseAuth;
  GoogleSignIn googleSignIn;

  AuthService({required this.firebaseAuth, required this.googleSignIn});

  signInWithGoogle() async {
    // ye jo signIn() hai ye pop up show karega jo jiss mei diff account show hongay
    final user = await googleSignIn.signIn();
    final googleAuth = await user!.authentication;
    final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    //
    // ye jo abi tk ooper kiyaa ye tu siraf google sign in k liye hai
    // ab agar wohi credentials k sth humein firebase sy auth krna hai tu wo neechay hai
    await firebaseAuth.signInWithCredential(credentials);
  }
}
