import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dementia Care Assistant App'),
        backgroundColor: const Color.fromARGB(255, 160, 10, 10),
      ),

      body: Container(
        color: Colors.white,
        child: ListView(
          children: const <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 160, 10, 10),
              ),
              child: UserAccountsDrawerHeader(
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 160, 10, 10)),
                accountName: Text(
                  'Makulah Swen',
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text('swen@gmail.com'),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('images/old_lady.jpg'),
                  backgroundColor: Color.fromARGB(255, 160, 10, 10),
                  // child: Text(
                  //   "M",
                  //   style: TextStyle(fontSize: 30.0, color: Colors.white),
                  // ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home '),
              // trailing: Icon(Icons.home_max_outlined),
              //onTap: () {
              // Navigator.pop(context);
              // },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Person '),
              //  trailing: Icon(Icons.person_2),
              // onTap: () {
              //  Navigator.pop(context)
              // },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(' Settings'),
              // onTap: () {
              //   Navigator.pop(context);
              // },
            ),
            ListTile(
              leading: Icon(Icons.report),
              title: Text(' Report '),
              // onTap: () {
              //   Navigator.pop(context);
              // },
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text(' Edit Profile '),
              // onTap: () {
              //   Navigator.pop(context);
              // },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('LogOut'),
              // onTap: () {
              //  Navigator.pop(context);
              // },
            ),
          ],
        ),
      ),
      //Drawer
    );
  }
}
