import 'package:youtube_clone/core/utils/exports.dart';

class TopHeader extends StatelessWidget {
  final UserModel user;
  const TopHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
            child: CircleAvatar(
          radius: 38,
          backgroundColor: Colors.grey,
          backgroundImage: CachedNetworkImageProvider(user.profilePic),
        )),
        Padding(
          padding: const EdgeInsets.only(bottom: 4, top: 10),
          child: Text(user.displayName,
              style:
                  const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 9),
          child: RichText(
              text: TextSpan(
                  style: const TextStyle(color: Colors.blueGrey),
                  children: [
                TextSpan(text: "@${user.userName}  "),
                TextSpan(text: "${user.subscription.length}  subscribers  "),
                TextSpan(text: "${user.videos} videos"),
              ])),
        ),
      ],
    );
  }
}
