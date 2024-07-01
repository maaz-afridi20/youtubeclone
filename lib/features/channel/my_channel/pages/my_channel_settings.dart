import 'package:youtube_clone/core/utils/exports.dart';
import 'package:youtube_clone/features/channel/my_channel/widgets/setting_field_item.dart';

class MyChannelSettings extends ConsumerStatefulWidget {
  const MyChannelSettings({super.key});

  @override
  ConsumerState<MyChannelSettings> createState() => _MyChannelSettingsState();
}

class _MyChannelSettingsState extends ConsumerState<MyChannelSettings> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 0),
        child: Column(
          children: <Widget>[
            Stack(children: [
              SizedBox(
                  height: 170,
                  width: double.infinity,
                  child: Image.asset(TImageString.flutterbackground,
                      fit: BoxFit.cover)),
              const Positioned(
                  left: 180,
                  top: 65,
                  child:
                      CircleAvatar(radius: 30, backgroundColor: Colors.grey)),
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
                identifier: "Name", onPressed: () {}, value: "Maaz Khan"),
            const SizedBox(height: 14),
            SettingsItem(
                identifier: "Handle", onPressed: () {}, value: "@maazkhan"),
            const SizedBox(height: 14),
            SettingsItem(
                identifier: "Description", onPressed: () {}, value: ""),

            Row(
              children: [
                const Text("Keep all my subscriber private"),
                Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      isSwitched = value;
                      setState(() {});
                    }),
              ],
            )
          ],
        ),
      )),
    );
  }
}
