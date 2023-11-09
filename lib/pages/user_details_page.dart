import 'package:flutter/material.dart';
import 'package:luis_ramirez_theksquaregroup/pages/list_page.dart';
import 'package:luis_ramirez_theksquaregroup/routes.dart';
import 'package:luis_ramirez_theksquaregroup/widgets/widgets.dart';

class UserDetailsPage extends StatefulWidget {
  const UserDetailsPage({super.key});
  static const route = 'UserDetailsPage';

  @override
  State<UserDetailsPage> createState() => _UserDetailsPageState();
}

class _UserDetailsPageState extends State<UserDetailsPage> {
  dynamic screen;
  dynamic safePadding;
  var arguments;
  var userInfoLastPage;

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size;
    safePadding = MediaQuery.of(context).padding;
    arguments = ModalRoute.of(context)?.settings.arguments as ScreenArguments;
    userInfoLastPage = arguments.value;

    return Board(
      backPressed: () async {
        Navigator.of(context).pushReplacementNamed(ListPage.route,
            arguments: ScreenArguments(direction: DirectionTransition.left));
        return true;
      },
      body: Stack(
        children: [
          SizedBox(
            height: screen.height,
            width: screen.width,
            child: SafeArea(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(userInfoLastPage.name),
                SizedBox(
                  height: screen.height / 100,
                ),
                Text(userInfoLastPage.email),
                SizedBox(
                  height: screen.height / 20,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pushReplacementNamed(
                    ListPage.route,
                  ),
                  child: Container(
                    width: screen.width / 5,
                    height: screen.height / 20,
                    color: Colors.blue,
                    child: const Center(
                        child: Text(
                      'Back',
                      style: TextStyle(color: Colors.white),
                    )),
                  ),
                )
              ],
            )),
          ),
        ],
      ),
    );
  }

  Widget errorSearchUsers() {
    return const Center(
        child: Text(
      "Error, try later ",
      style: TextStyle(color: Colors.black),
    ));
  }
}
