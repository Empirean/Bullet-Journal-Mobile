import 'package:flutter/material.dart';

class JournalDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset('assets/bullet_journal.png'),
                SizedBox(height: 20.0,),
                Text(
                  'Bullet Journal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          ListTile(
            title: Text(
              'Tracker',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            onTap: () {
              Navigator.of(context).popAndPushNamed('/');
            },
          ),
          ListTile(
            title: Text(
              'Current Task',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            onTap: () {
              Navigator.of(context).popAndPushNamed('/current_task');
            },
          ),
          ListTile(
            title: Text(
              'Monthly Task',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            onTap: () {
              Navigator.of(context).popAndPushNamed('/monthly_task');
            },
          ),
          ListTile(
            title: Text(
              'Future Log',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            onTap: () {
              Navigator.of(context).popAndPushNamed('/future_task');
            },
          ),
          ListTile(
            title: Text(
              'Notes',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            onTap: () {
              Navigator.of(context).popAndPushNamed('/notes');
            },
          )
        ],
      ),
    );
  }
}
