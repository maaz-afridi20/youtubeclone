import '../../../../core/utils/exports.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Row(children: [
          Expanded(
            flex: 3,
            child: Container(
                height: 40,
                decoration: BoxDecoration(
                    color: softBlueGreyBackGround,
                    borderRadius: BorderRadius.circular(9)),
                child: TextButton(
                    onPressed: () {},
                    child: const Text("Manage Videos",
                        style: TextStyle(color: Colors.black)))),
          ),
          Expanded(
              child: ImageButton(
                  onPressed: () {}, image: TImageString.pen, haveColor: true)),
          Expanded(
              child: ImageButton(
                  onPressed: () {},
                  image: TImageString.timewatched,
                  haveColor: true))
        ]));
  }
}
