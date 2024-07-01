import '../../../../core/utils/exports.dart';

class PageTabbar extends StatelessWidget {
  const PageTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.only(top: 14),
        child: TabBar(
            isScrollable: true,
            labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.only(top: 12),
            tabs: [
              Text("Home"),
              Text("Videos"),
              Text("Shorts"),
              Text("Community"),
              Text("Playlists"),
              Text("Channel"),
              Text("About"),
            ]));
  }
}
