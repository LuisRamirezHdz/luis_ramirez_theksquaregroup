part of 'widgets.dart';

class Board extends StatefulWidget {
  final Widget? body;
  final Widget? backgroundBody;
  final Future<bool> Function() backPressed;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? floatingActionButton;
  final Widget? drawer;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final List<DeviceOrientation> deviceOrientation;
  final bool? showLine;
  final Gradient? gradient;
  final double? heightLine;
  final Widget? bottomBar;

  Board({
    Key? key,
    this.body,
    this.backgroundBody,
    Future<bool> Function()? backPressed,
    this.floatingActionButtonLocation,
    this.floatingActionButton,
    this.drawer,
    this.scaffoldKey,
    List<DeviceOrientation>? deviceOrientation,
    this.showLine = false,
    this.gradient,
    this.heightLine,
    this.bottomBar,
  })  : backPressed = backPressed ?? (() => Future.value(false)),
        deviceOrientation = deviceOrientation ?? [DeviceOrientation.portraitUp],
        super(key: key);

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  dynamic screen;
  dynamic textScaleFactor;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations(widget.deviceOrientation);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size;
    textScaleFactor = MediaQuery.of(context).textScaleFactor;
    num aux = textScaleFactor - 1;

    return WillPopScope(
      onWillPop: widget.backPressed,
      child: Scaffold(
        key: widget.scaffoldKey,
        drawer: widget.drawer,
        floatingActionButton: widget.floatingActionButton,
        floatingActionButtonLocation: widget.floatingActionButtonLocation,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
                textScaleFactor:
                    textScaleFactor > 1 ? (1 + (aux / 3)) : textScaleFactor),
            child: Stack(
              children: <Widget>[
                // if (widget.useSafeArea && widget.useSingleChildScroll) SafeArea( child: SingleChildScrollView(physics: const ClampingScrollPhysics(), child: widget.body))
                // else if (widget.useSafeArea && !widget.useSingleChildScroll) SafeArea(child: Container(child: widget.body,))
                // else if (!widget.useSafeArea && widget.useSingleChildScroll) SingleChildScrollView(physics: const ClampingScrollPhysics(), child: widget.body)
                // else
                SingleChildScrollView(
                    physics: const ClampingScrollPhysics(), child: widget.body),
                widget.bottomBar ?? Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
