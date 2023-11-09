import 'package:flutter/material.dart';
import 'package:luis_ramirez_theksquaregroup/config/config.dart';
import 'package:luis_ramirez_theksquaregroup/models/user.dart';
import 'package:luis_ramirez_theksquaregroup/utils/utils.dart';
import 'package:luis_ramirez_theksquaregroup/widgets/widgets.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});
  static const route = 'ListPage';

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  dynamic screen;
  dynamic safePadding;

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size;
    safePadding = MediaQuery.of(context).padding;

    return Board(
      body: Stack(
        children: [
          SizedBox(
            height: screen.height,
            width: screen.width,
            child: SafeArea(
              child: Center(
                  child: FutureBuilder(
                      future: Request.get(Endpoints.users),
                      builder: ((context, snapshot) {
                        if (snapshot.connectionState ==
                                ConnectionState.waiting ||
                            snapshot.connectionState != ConnectionState.done) {
                          return const WaitingRequest();
                        }

                        if (snapshot.hasError ||
                            !snapshot.hasData ||
                            snapshot.data == null) {
                          return errorSearchUsers();
                        }

                        List<UserModel> users = [];
                        var aux = 0;
                        snapshot.data[0].keys.forEach((value) {
                          UserModel user =
                              UserModel.fromJson(snapshot.data[aux]);
                          users.add(user);
                          aux++;
                        });

                        return SizedBox(
                          height: screen.height / 1.7,
                          child: SingleChildScrollView(
                            physics: const ClampingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: users.map<Widget>((user) {
                                return UserListItem(
                                  user: user,
                                );
                              }).toList(),
                            ),
                          ),
                        );
                      }))),
            ),
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
