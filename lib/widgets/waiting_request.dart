part of 'widgets.dart';

class WaitingRequest extends StatefulWidget {
  final String? image;
  final String? fisrtText;
  final String? secondText;

  const WaitingRequest({
    Key? key,
    this.image = 'assets/images/no-tracking.png',
    this.fisrtText,
    this.secondText,
  }) : super(key: key);

  @override
  State<WaitingRequest> createState() => _WaitingRequestState();
}

class _WaitingRequestState extends State<WaitingRequest> {
  dynamic screen;

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size;

    return SizedBox(
      height: 0.65 * screen.height,
      child: const Column(
        children: [
          Text("Loading..."),
          Progress(),
        ],
      ),
    );
  }
}
