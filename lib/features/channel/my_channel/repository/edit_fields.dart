import 'package:youtube_clone/core/utils/exports.dart';

final editSettingsProvider = Provider((ref) => EditSettingFields(
    auth: FirebaseAuth.instance, firestore: FirebaseFirestore.instance));

class EditSettingFields {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;
  EditSettingFields({
    required this.firestore,
    required this.auth,
  });

  editDisplayName(displayName) async {
    await firestore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .update({"displayName": displayName});
  }

  editUserName(userName) async {
    await firestore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .update({"userName": userName});
  }

  editDescription(description) async {
    await firestore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .update({"description": description});
  }
}
