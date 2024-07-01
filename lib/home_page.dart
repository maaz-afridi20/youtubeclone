import 'package:youtube_clone/core/utils/exports.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(TImageString.youtube, height: 36),
                const SizedBox(width: 4),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: SizedBox(
                    height: 42,
                    child: ImageButton(
                      image: TImageString.cast,
                      onPressed: () {},
                      haveColor: false,
                    ),
                  ),
                ),
                SizedBox(
                  height: 38,
                  child: ImageButton(
                    image: TImageString.notification,
                    onPressed: () {},
                    haveColor: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 15),
                  child: SizedBox(
                    height: 41.5,
                    child: ImageButton(
                      image: TImageString.search,
                      onPressed: () {},
                      haveColor: false,
                    ),
                  ),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    return ref.watch(currentUserProvider).when(
                        data: (mcurrentUser) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.grey,
                              backgroundImage: CachedNetworkImageProvider(
                                  mcurrentUser.profilePic),
                            ),
                          );
                        },
                        error: (error, stackTrace) => const ErrorPage(),
                        loading: () => const Loader());
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
