import 'package:flutter/material.dart';
import 'package:sample_chat_app/components/my_appbar.dart';
import 'package:sample_chat_app/components/user_tile.dart';

import '../components/my_drawer.dart';
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
    Theme.of(context);
    final currentUser = _authService.getCurrentUser();
    return Scaffold(
      appBar: MyAppbar(
          title: "H O M E", userEmail: currentUser?.email, onLogout: logout),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: buildUserList(),
      ),
    );
  }

  Widget buildUserList() {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: _chatService.getUsers(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
            ),
          );
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
            ),
          );
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No users found'));
        }
        return ListView(
          children: snapshot.data!
              .map<Widget?>(
                (userData) => _buildUserListItem(userData, context),
              )
              .where((widget) => widget != null)
              .cast<Widget>()
              .toList(),
        );
      },
    );
  }

  Widget? _buildUserListItem(
    Map<String, dynamic> userData,
    BuildContext context,
  ) {
    final currentUserEmail = _authService.getCurrentUser()?.email;
    final userEmail = userData["email"] as String?;

    if (userEmail != null && userEmail != currentUserEmail) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: UserTile(
            text: userEmail,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatPage(
                    receiverEmail: userEmail,
                  ),
                ),
              );
            }),
      );
    }
    return null;
  }
}
