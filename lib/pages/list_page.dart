import 'package:flutter/material.dart';
import 'package:luis_ramirez_theksquaregroup/config/config.dart';
import 'package:luis_ramirez_theksquaregroup/models/user.dart';
import 'package:luis_ramirez_theksquaregroup/utils/utils.dart';
import 'package:luis_ramirez_theksquaregroup/widgets/widgets.dart';

class ListPage extends StatefulWidget {
  final AsyncSnapshot? data;

  const ListPage({super.key, this.data});
  static const route = 'ListPage';

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  dynamic screen;
  dynamic safePadding;

  late Future _usersData;

  Future<dynamic> _fetchCampusData() async {
    if (widget.data == null) {
      var response = await Request.get(Endpoints.users);
      return response;
    } else
      return widget.data!.data;
  }

  @override
  void initState() {
    _usersData = _fetchCampusData();
    super.initState();
  }

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
              child: FutureBuilder(
                  future: _usersData,
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting ||
                        snapshot.connectionState != ConnectionState.done) {
                      return const WaitingRequest();
                    }

                    if (snapshot.hasError ||
                        !snapshot.hasData ||
                        snapshot.data == null) {
                      return errorSearchUsers();
                    }

                    List<UserModel> users = [];

                    snapshot.data!.map((document) {
                      UserModel user = UserModel.fromJson(document);
                      users.add(user);
                    }).toList();

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Displaying data"),
                        SizedBox(
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
                        ),
                      ],
                    );
                  })),
            ),
          ),
        ],
      ),
    );
  }

  Widget errorSearchUsers() {
    return const Center(
        child: Text(
      "Error, try later",
      style: TextStyle(color: Colors.black),
    ));
  }
}
