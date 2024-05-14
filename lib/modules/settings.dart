import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/shared/styles/colors.dart';

class settings extends StatelessWidget {
   settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: ListView(
          padding: EdgeInsets.all(10),
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(
                        'assets/images/photo_2024-05-08_22-44-43.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'User name',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                ],
              ),
            ),            
            SizedBox(height: 30),
            ...List.generate(listTitles.length, (index) {
              final tile = listTitles[index];
              return Card(
                  color: primary_c,
                  elevation: 4,
                  shadowColor: Colors.black12,
                  child: ListTile(
                    leading: Icon(tile.icon),
                    title: Text(tile.title),
                    trailing: Icon(Icons.chevron_right),
                  ));
            })
          ],
        ),
      ),
    );
  }
}
class ListTitle {
  final IconData icon;
  final String title;

  ListTitle({required this.icon, required this.title});
}

List<ListTitle> listTitles = [
  ListTitle(icon: Icons.person, title: 'My Account'),
  ListTitle(icon: Icons.location_on_outlined, title: 'Location'),
  ListTitle(icon: CupertinoIcons.bell, title: 'Notification'),
  ListTitle(icon: CupertinoIcons.arrow_right_arrow_left, title: 'Logout')
];



