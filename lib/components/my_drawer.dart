import 'package:flutter/material.dart';

import '../services/auth/auth_service.dart';
import '../screens/settings_screen.dart';

class MyDrawer extends StatelessWidget {
  //constructor
  const MyDrawer({super.key});
  //logout function
  void logout() {
    //get Auth service
    AuthService().signOut();
  }

  @override
  Widget build(BuildContext context) {
    //initialize theme variable
    final theme = Theme.of(context);
    //return drawer
    return Drawer(
        backgroundColor: theme.colorScheme.surface,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //icon
            Column(
              children: [
                DrawerHeader(
                    child: Icon(
                  Icons.chat,
                  size: 60,
                  color: theme.colorScheme.primary,
                )),
                Text(
                  "ChatAppVeenay",
                  style: theme.textTheme.displaySmall
                      ?.copyWith(color: theme.colorScheme.primary),
                ),
              ],
            ),

            //home
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    title: const Text("H O M E"),
                    onTap: () {
                      Navigator.pop(context);
                    },
                    leading: const Icon(Icons.home),
                  ),
                ),

                //settings
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: ListTile(
                    title: const Text("S E T T I N G S"),
                    onTap: () {
                      //hide drawer
                      Navigator.pop(context);
                      //navigate to settings screen
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingsScreen()));
                    },
                    leading: const Icon(Icons.settings),
                  ),
                ),
              ],
            ),

            //logout
            Padding(
              padding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
              child: ListTile(
                title: const Text("L O G O U T"),
                onTap: logout,
                leading: const Icon(Icons.logout),
              ),
            ),
          ],
        ));
  }
}
