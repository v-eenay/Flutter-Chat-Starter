import 'package:flutter/material.dart'; // Import Flutter material design package for UI components
import 'package:sample_chat_app/components/my_appbar.dart'; // Import custom AppBar component
import 'package:sample_chat_app/components/user_tile.dart'; // Import custom UserTile component

import '../components/my_drawer.dart'; // Import custom Drawer component
import '../services/auth/auth_service.dart'; // Import the authentication service
import '../services/chat/chat_service.dart'; // Import the chat service for handling chat operations
import 'chat_page.dart'; // Import the ChatPage for navigating to the chat screen

// HomePage is a StatelessWidget that displays the home screen with a list of users
class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ChatService _chatService =
      ChatService(); // Service to handle chat-related operations
  final AuthService _authService =
      AuthService(); // Service to handle authentication operations

  /// Logs out the current user.
  void logout() {
    _authService
        .signOut(); // Calls the signOut method from AuthService to log out the user
  }

  @override
  Widget build(BuildContext context) {
    final currentUser =
        _authService.getCurrentUser(); // Get the current user's information
    return Scaffold(
      appBar: MyAppbar(
        title: "H O M E", // Title displayed in the AppBar
        userEmail: currentUser
            ?.email, // Email of the current user displayed in the AppBar
        onLogout: logout, // Logout function passed as a callback to the AppBar
      ),
      drawer: MyDrawer(), // Custom drawer component
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Padding around the body content
        child: buildUserList(), // Builds the list of users
      ),
    );
  }

  /// Builds the list of users by streaming data from the ChatService.
  Widget buildUserList() {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: _chatService.getUsers(), // Stream of user data from ChatService
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          // Display error message if there's an error in the stream
          return Center(
            child: Text(
              'Error: ${snapshot.error}', // Error message
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .error, // Set text color based on the theme
                  ),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while waiting for data
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(), // Loading spinner
                SizedBox(height: 20), // Space between spinner and text
                Text("Loading Users..."), // Loading text
              ],
            ),
          );
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          // Display a message if no users are found
          return const Center(child: Text('No users found'));
        }
        // Build a list of user tiles from the user data
        return ListView(
          children: snapshot.data!
              .map<Widget?>(
                (userData) => _buildUserListItem(
                    userData, context), // Map user data to user tiles
              )
              .where((widget) => widget != null) // Filter out null widgets
              .cast<Widget>()
              .toList(),
        );
      },
    );
  }

  /// Builds a user tile for each user in the list.
  Widget? _buildUserListItem(
    Map<String, dynamic> userData, // Data for a single user
    BuildContext context, // Build context for navigation
  ) {
    final currentUserEmail =
        _authService.getCurrentUser()?.email; // Get the current user's email
    final userEmail =
        userData["email"] as String?; // Get the email of the user from userData

    // Check if user email is not null and is not the current user's email
    if (userEmail != null && userEmail != currentUserEmail) {
      return Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 4.0, horizontal: 8.0), // Padding around each user tile
        child: UserTile(
          text: userEmail, // Display the user's email in the tile
          onTap: () {
            // Navigate to the ChatPage when the tile is tapped
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(
                  receiverEmail:
                      userEmail, // Pass the receiver's email to the ChatPage
                ),
              ),
            );
          },
        ),
      );
    }
    return null; // Return null if the user email is the same as the current user's email
  }
}
