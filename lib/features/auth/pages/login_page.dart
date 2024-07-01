import 'package:youtube_clone/core/utils/exports.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Column(children: [
      Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 25),
          child: Image.asset(TImageString.youtubesignin, height: 150)),
      const Text("Wellcome to youtube",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey)),
      const Spacer(),
      Padding(
        padding: const EdgeInsets.only(bottom: 55),
        child: GestureDetector(
            onTap: () async {
              await ref.read(authServiceProvider).signInWithGoogle();
            },
            child: Image.asset(TImageString.signinwithgoogle, height: 60)),
      )
    ]))));
  }
}
