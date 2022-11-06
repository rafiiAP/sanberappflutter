import 'package:flutter/material.dart';
import 'drawer.dart';
import 'account.dart';
import 'search.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Search(),
    Akun(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        // actions: const <Widget>[
        //   Padding(
        //     padding: EdgeInsets.all(8.0),
        //     child: Icon(Icons.search),
        //   )
        // ],
      ),
      endDrawer: DrawerScreen(),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.only(top: 40),
          color: Colors.white,
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Let's Find",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w800),
                  ),
                  Icon(
                    Icons.notifications,
                    color: Colors.grey,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                height: 50,
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey),
                ),
                child: TextFormField(
                  decoration: InputDecoration.collapsed(
                      hintText: 'Search Jobs or Position'),
                ),
              ),
              SizedBox(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Jobs For You',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height: 40),
              jobs_item(context),
              _widgetOptions.elementAt(_selectedIndex),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

Container jobs_item(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height / 3,
    child: GridView.count(
      primary: false,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      crossAxisCount: 2,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xffE9FFEB),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/img/gojek.png",
                height: 40,
                width: 40,
              ),
              SizedBox(height: 16),
              Text(
                'Digital Marketing',
                style: titleStyle(),
              ),
              SizedBox(height: 16),
              Text(
                '1-3 Year Experience',
                style: subTitle(),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'FullTime',
                    style: potitionText(),
                  ),
                  Text(
                    'Senior',
                    style: potitionText(),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0x2DFFCF40),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/img/shopee.png',
                height: 40,
                width: 40,
              ),
              SizedBox(height: 16),
              Text(
                'Content Creator',
                style: titleStyle(),
              ),
              SizedBox(height: 16),
              Text(
                '1-3 year experience',
                style: subTitle(),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Full Time',
                    style: potitionText(),
                  ),
                  Text(
                    'Internship',
                    style: potitionText(),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0x2DFFCF40),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/img/bukalapak.png',
                height: 40,
                width: 40,
              ),
              SizedBox(height: 16),
              Text(
                'Mobile Developer',
                style: titleStyle(),
              ),
              SizedBox(height: 16),
              Text(
                'Fresh Graduate',
                style: subTitle(),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Full Time',
                    style: potitionText(),
                  ),
                  Text(
                    'Junior',
                    style: potitionText(),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xffE9FFEB),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/img/blibli.png',
                height: 40,
                width: 40,
              ),
              SizedBox(height: 16),
              Text(
                'UX Designer',
                style: titleStyle(),
              ),
              SizedBox(height: 16),
              Text(
                'Fresh Graduate',
                style: subTitle(),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Full Time',
                    style: potitionText(),
                  ),
                  Text(
                    'Junior',
                    style: potitionText(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

TextStyle potitionText() {
  return TextStyle(color: Colors.grey, fontWeight: FontWeight.w400);
}

TextStyle subTitle() => TextStyle(fontWeight: FontWeight.w500);

TextStyle titleStyle() => TextStyle(fontSize: 15, fontWeight: FontWeight.w700);
