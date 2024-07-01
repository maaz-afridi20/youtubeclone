import 'package:youtube_clone/core/utils/exports.dart';

final formkey = GlobalKey<FormState>();

class UserNamePage extends ConsumerStatefulWidget {
  final String displayName;
  final String profilePic;
  final String email;

  const UserNamePage(
      {super.key,
      required this.displayName,
      required this.profilePic,
      required this.email});

  @override
  ConsumerState<UserNamePage> createState() => _UserNamePageState();
}

class _UserNamePageState extends ConsumerState<UserNamePage> {
  final TextEditingController usernameController = TextEditingController();
  bool isValidate = true;
  void validateUserName() async {
    String? targetedUserName;
    final userMap = await FirebaseFirestore.instance.collection("users").get();

    // ye bss siraf saray docs ko aik aik fetch kr raha hai
    // orr bss yee siraf iss ko muser mein return kr dega orr bss hm nay siraf
    // iss ko to list kr diya bs..
    final users = userMap.docs.map((muser) => muser).toList();

    for (var user in users) {
      if (usernameController.text == user.data()["userName"]) {
        targetedUserName = user.data()["userName"];
        isValidate = false;
        setState(() {});
      }
      if (usernameController.text != targetedUserName) {
        isValidate = true;
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 26, horizontal: 14),
                child: Text("Enter user name",
                    style: TextStyle(color: Colors.blueGrey))),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Form(
                  child: TextFormField(
                    key: formkey,
                    controller: usernameController,
                    onChanged: (muserName) {
                      // ye onchange method har uss time call hota haii jab jab
                      // hm koii text type krtay hain textfield mein...
                      validateUserName();
                    },
                    autovalidateMode: AutovalidateMode.always,
                    validator: (muserName) {
                      return isValidate ? null : "username already taken";
                    },
                    decoration: InputDecoration(
                        suffixIcon: isValidate
                            ? const Icon(Icons.verified_user_rounded)
                            : const Icon(Icons.cancel),
                        suffixIconColor: isValidate ? Colors.green : Colors.red,
                        hintText: "Enter user name",
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                )),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30, left: 8, right: 8),
              child: FlatButton(
                  text: "Continue",
                  onPressed: () async {
                    // add user data to database

                    isValidate
                        ? await ref
                            .read(userDataServiceProvider)
                            .addDataToFirestore(
                                displayName: widget.displayName,
                                userName: usernameController.text,
                                email: widget.email,
                                profilePic: widget.profilePic,
                                description: '')
                        : null;
                  },
                  colour: isValidate ? Colors.green : Colors.green.shade100),
            ),
          ],
        ),
      ),
    );
  }
}
