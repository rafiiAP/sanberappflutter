import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('Rafii Ananda Putra'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/img/raf.jpg'),
            ),
            accountEmail: Text('prafi726@gmail.com'),
          ),
          DrawerListTitle(
            iconData: Icons.group,
            title: 'NewGroup',
            onTitlePressed: () {},
          ),
          DrawerListTitle(
            iconData: Icons.lock,
            title: 'New Secret Group',
            onTitlePressed: () {},
          ),
          DrawerListTitle(
            iconData: Icons.notifications,
            title: 'New Channel Group',
            onTitlePressed: () {},
          ),
          DrawerListTitle(
            iconData: Icons.contacts,
            title: 'contacts',
            onTitlePressed: () {},
          ),
          DrawerListTitle(
            iconData: Icons.bookmark_border,
            title: 'Save Message',
            onTitlePressed: () {},
          ),
          DrawerListTitle(
            iconData: Icons.phone,
            title: 'Calls',
            onTitlePressed: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTitle extends StatelessWidget {
  final IconData? iconData;
  final String? title;
  final VoidCallback? onTitlePressed;

  const DrawerListTitle(
      {Key? key, this.iconData, this.title, this.onTitlePressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: onTitlePressed,
        dense: true,
        leading: Icon(iconData),
        title: Text(
          title!,
          style: TextStyle(fontSize: 16),
        ));
  }
}
