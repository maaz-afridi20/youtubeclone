import 'package:youtube_clone/core/utils/exports.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Youtube',
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const LoginPage();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Loader();
          }

          return StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("users")
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData || !snapshot.data!.exists) {
                  final user = FirebaseAuth.instance.currentUser;
                  return UserNamePage(
                      displayName: user!.displayName!,
                      profilePic: user.photoURL!,
                      email: user.email!);
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Loader();
                }
                return const MyChannelSettings();
              });
        },
      ),
    );
  }
}
