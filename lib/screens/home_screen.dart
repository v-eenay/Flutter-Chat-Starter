import 'package:flutter/material.dart';
import 'package:sample_chat_app/components/my_drawer.dart';
import 'package:sample_chat_app/screens/chat_page.dart';

import '../components/user_tile.dart';
import '../services/auth/auth_service.dart';
import '../services/chat/chat_service.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //chat and auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();
  void logout() {
    //get Auth service
    AuthService().signOut();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "H O M E",
          style: theme.textTheme.displaySmall
              ?.copyWith(color: theme.colorScheme.surface),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: logout, icon: const Icon(Icons.logout))
        ],
      ),
      drawer: MyDrawer(),
      body: Center(child: buildUserList()),
    );
  }

  Widget buildUserList() {
    return StreamBuilder(
        //listen to stream(users)
        stream: _chatService.getUsers(),
        //builder
        builder: (context, snapshot) {
          //check if snapshot has error
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          //loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: Column(
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text("Loading Users..."),
              ],
            ));
          }
          //return list of the users
          return ListView(
            children: snapshot.data!
                .map<Widget>(
                    (userData) => _buildUserListItem(userData, context))
                .toList(),
          );
        });
  }

  //build individual list tile for users
  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    //display all of the users instead of the current user
    return UserTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ChatPage(
            receiverEmail: userData["email"],
          );
        }));
      },
      text: userData["email"],
    );
  }
}
