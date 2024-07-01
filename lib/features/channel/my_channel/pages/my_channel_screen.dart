import 'package:youtube_clone/core/utils/exports.dart';
import 'package:youtube_clone/features/channel/my_channel/parts/buttons.dart';

class MyChannelScreen extends ConsumerWidget {
  const MyChannelScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(currentUserProvider).when(
        data: (mcurrentUser) {
          return DefaultTabController(
              length: 7,
              child: Scaffold(
                body: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: <Widget>[
                        //
                        //! top header...
                        TopHeader(
                          user: mcurrentUser,
                        ),
                        //
                        const Text("More about this channel"),
                        const SizedBox(height: 5),

                        //
                        const Buttons(),
                        //
                        //! tab bar
                        const PageTabbar(),
                        //
                        //tab bar view
                        const TabPages()
                      ],
                    ),
                  ),
                ),
              ));
        },
        error: (error, stackTrace) => const ErrorPage(),
        loading: () => const Loader());
  }
}
