import 'package:youtube_clone/core/utils/exports.dart';
import 'package:youtube_clone/features/channel/my_channel/widgets/edit_setting_dialog.dart';

class MyChannelSettings extends ConsumerStatefulWidget {
  const MyChannelSettings({super.key});

  @override
  ConsumerState<MyChannelSettings> createState() => _MyChannelSettingsState();
}

class _MyChannelSettingsState extends ConsumerState<MyChannelSettings> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return ref.watch(currentUserProvider).when(
        data: (mcurrentUserData) {
          return Scaffold(
            body: SafeArea(
                child: Padding(
              padding: const EdgeInsets.only(top: 0),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Stack(children: [
                      SizedBox(
                          height: 170,
                          width: double.infinity,
                          child: Image.asset(TImageString.flutterbackground,
                              fit: BoxFit.cover)),
                      Positioned(
                          left: 180,
                          top: 65,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.grey,
                            backgroundImage: CachedNetworkImageProvider(
                                mcurrentUserData.profilePic),
                          )),
                      Positioned(
                          right: 16,
                          top: 10,
                          child: Image.asset(TImageString.camera,
                              height: 34, color: Colors.white))
                    ]),
                    const SizedBox(height: 14),
                    //
                    //second part
                    SettingsItem(
                        identifier: "Name",
                        onPressed: () {
                          setState(() {});
                          showDialog(
                              context: context,
                              builder: (context) => SettingsDialog(
                                  identifier: "Display Name",
                                  onSave: (nametobechange) => ref
                                      .watch(editSettingsProvider)
                                      .editDisplayName(nametobechange)));
                        },
                        value: mcurrentUserData.displayName),
                    const SizedBox(height: 14),
                    SettingsItem(
                        identifier: "Handle",
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => SettingsDialog(
                                  identifier: "Handle",
                                  onSave: (userName) => ref
                                      .watch(editSettingsProvider)
                                      .editUserName(userName)));
                        },
                        value: "@${mcurrentUserData.userName}"),
                    const SizedBox(height: 14),
                    SettingsItem(
                        identifier: "Description",
                        onPressed: () {
                          setState(() {});
                          showDialog(
                              context: context,
                              builder: (context) => SettingsDialog(
                                  identifier: "Description",
                                  onSave: (description) => ref
                                      .read(editSettingsProvider)
                                      .editDescription(description)));
                        },
                        value: mcurrentUserData.description),

                    Padding(
                        padding: const EdgeInsets.only(left: 12, right: 8),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Keep all my subscriber private"),
                              Switch(
                                  value: isSwitched,
                                  onChanged: (value) {
                                    isSwitched = value;
                                    setState(() {});
                                  }),
                            ])),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: Text(
                        "Changes made on your names and profile picture only visible to youtube and not other Google Services",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    )
                  ],
                ),
              ),
            )),
          );
        },
        error: (error, stackTrace) => const ErrorPage(),
        loading: () => const Loader());
  }
}
