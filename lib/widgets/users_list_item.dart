part of 'widgets.dart';

class UserListItem extends StatefulWidget {
  final UserModel? user;

  const UserListItem({
    Key? key,
    this.user,
  }) : super(key: key);

  @override
  State<UserListItem> createState() => _UserListItemState();
}

class _UserListItemState extends State<UserListItem> {
  dynamic screen;

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => Navigator.of(context).pushReplacementNamed(
          UserDetailsPage.route,
          arguments: ScreenArguments(value: widget.user!)),
      child: Container(
        height: screen.height / 10,
        width: screen.width / 1.2,
        color: Colors.blue,
        margin: EdgeInsets.only(
          bottom: screen.width / 25,
        ),
        child: Center(
            child: Text(
          widget.user!.name!,
          style: const TextStyle(color: Colors.white),
        )),
      ),
    );
  }
}
