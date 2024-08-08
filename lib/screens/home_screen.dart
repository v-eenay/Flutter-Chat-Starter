import 'package:flutter/material.dart';

import '../components/my_drawer.dart';
import '../components/user_tile.dart';
import '../services/auth/auth_service.dart';
import '../services/chat/chat_service.dart';
import 'chat_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  void logout() {
    _authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currentUser = _authService.getCurrentUser();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "H O M E",
          style: theme.textTheme.displaySmall
              ?.copyWith(color: theme.colorScheme.surface),
        ),
        centerTitle: true,
        actions: [
          Text(
            currentUser?.email ?? '',
            style: TextStyle(color: theme.colorScheme.surface),
          ),
          IconButton(onPressed: logout, icon: const Icon(Icons.logout))
        ],
      ),
      drawer: MyDrawer(),
      body: Center(child: buildUserList()),
    );
  }

  Widget buildUserList() {
    return StreamBuilder(
        stream: _chatService.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text("Loading Users..."),
              ],
            ));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No users found'));
          }
          return ListView(
            children: snapshot.data!
                .map<Widget?>(
                    (userData) => _buildUserListItem(userData, context))
                .where((widget) => widget != null)
                .cast<Widget>()
                .toList(),
          );
        });
  }

  Widget? _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    final currentUserEmail = _authService.getCurrentUser()?.email;
    final userEmail = userData["email"] as String?;

    if (userEmail != null && userEmail != currentUserEmail) {
      return UserTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ChatPage(
              receiverEmail: userEmail,
            );
          }));
        },
        text: userEmail,
      );
    }
    return null;
  }
}
