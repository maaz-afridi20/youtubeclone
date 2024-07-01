import 'package:youtube_clone/core/utils/exports.dart';

final userDataServiceProvider = Provider((ref) => UserDataService(
    auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance));

class UserDataService {
  FirebaseAuth auth;
  FirebaseFirestore firestore;
  UserDataService({required this.auth, required this.firestore});

  addDataToFirestore(
      {required String displayName,
      required String userName,
      required String email,
      required String profilePic,
      List<String>? subscription,
      int? videos,
      required String description}) async {
    UserModel user = UserModel(
        displayName: displayName,
        userName: userName,
        email: email,
        profilePic: profilePic,
        subscription: [],
        videos: 0,
        userId: auth.currentUser!.uid,
        description: description,
        type: "user");

    await firestore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .set(user.toMap());
  }

  Future<UserModel> fetchCurrentUserData() async {
    final currentUserMap = await FirebaseFirestore.instance
        .collection("users")
        .doc(auth.currentUser!.uid)
        .get();
    final user = UserModel.fromMap(currentUserMap.data()!);
    return user;
  }
}
