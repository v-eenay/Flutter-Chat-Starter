import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore package for database operations
import 'package:flutter/material.dart'; // Import Flutter material design package for UI components
import '../services/auth/auth_service.dart'; // Import the authentication service
import '../services/chat/chat_service.dart'; // Import the chat service for handling chat operations

// ChatPage is a StatefulWidget that allows users to chat with others
class ChatPage extends StatefulWidget {
  final String
      receiverEmail; // Email of the user with whom the chat is taking place

  // Constructor for ChatPage, which takes the receiver's email as a parameter
  ChatPage({super.key, required this.receiverEmail});

  @override
  _ChatPageState createState() => _ChatPageState();
}

// _ChatPageState is the state class for ChatPage, managing the chat interactions and UI
class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController =
      TextEditingController(); // Controller for the message input field
  final ChatService _chatService =
      ChatService(); // Service to handle chat-related operations
  final AuthService _authService =
      AuthService(); // Service to handle authentication operations

  String? _receiverID; // ID of the user with whom the chat is taking place

  @override
  void initState() {
    super.initState();
    _fetchReceiverID(); // Fetch the receiver ID when the page initializes
  }

  /// Fetches the receiver's user ID from Firestore based on their email.
  Future<void> _fetchReceiverID() async {
    try {
      // Attempt to fetch the receiver ID using their email
      final receiverID = await _chatService.getReceiverID(widget.receiverEmail);
      setState(() {
        _receiverID =
            receiverID; // Update the state with the fetched receiver ID
      });
    } catch (e) {
      // Handle potential errors in fetching the receiver ID
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Failed to fetch receiver ID: ${e.toString()}', // Display the error message
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onError, // Set text color based on the theme
                ),
          ),
          backgroundColor: Theme.of(context)
              .colorScheme
              .error, // Set the background color for the SnackBar
          duration: const Duration(
              seconds: 3), // Set duration for the SnackBar display
        ),
      );
    }
  }

  /// Sends a message to the receiver if the message is not empty and receiver ID is available.
  void sendMessage() async {
    // Check if the message input is not empty and receiver ID is available
    if (_messageController.text.isNotEmpty && _receiverID != null) {
      try {
        // Attempt to send the message using the chat service
        await _chatService.sendMessage(_receiverID!, _messageController.text);
        _messageController
            .clear(); // Clear the input field after sending the message
      } catch (e) {
        // Handle potential errors in sending the message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Failed to send message: ${e.toString()}', // Display the error message
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context)
                        .colorScheme
                        .onError, // Set text color based on the theme
                  ),
            ),
            backgroundColor: Theme.of(context)
                .colorScheme
                .error, // Set the background color for the SnackBar
            duration: const Duration(
                seconds: 3), // Set duration for the SnackBar display
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Retrieve the current theme for styling
    return Scaffold(
      appBar: AppBar(
        title: Text(widget
            .receiverEmail), // Display the receiver's email in the app bar
        backgroundColor:
            theme.colorScheme.primary, // Set app bar background color
        foregroundColor:
            theme.colorScheme.onPrimary, // Set text color in the app bar
      ),
      body: Column(
        children: [
          Expanded(
            child: _receiverID == null
                ? Center(
                    child: CircularProgressIndicator(
                        color: theme.colorScheme
                            .secondary)) // Show a loading indicator while fetching receiver ID
                : _buildMessagesList(
                    theme), // Build the list of messages if receiver ID is available
          ),
          _buildMessageInput(
              theme) // Build the input field for typing and sending messages
        ],
      ),
    );
  }

  /// Builds the list of messages using a StreamBuilder to listen to real-time changes in the Firestore collection.
  Widget _buildMessagesList(ThemeData theme) {
    final String? senderID =
        _authService.getCurrentUser()?.uid; // Get the current user's ID
    // Check if the sender ID or receiver ID is not available
    if (senderID == null || _receiverID == null) {
      return Center(
          child: Text(
        'Unable to load messages', // Display a message if unable to load messages
        style: theme.textTheme.bodyLarge,
      ));
    }

    return StreamBuilder(
      stream: _chatService.getMessages(
          senderID, _receiverID!), // Listen to real-time updates of messages
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(
              child: Text(
            'Error loading messages', // Display an error message if loading fails
            style: theme.textTheme.bodyLarge,
          ));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
                  color: theme.colorScheme
                      .secondary)); // Show a loading indicator while waiting for data
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
              child: Text(
            'No messages yet', // Display a message if no messages are found
            style: theme.textTheme.bodyLarge,
          ));
        }
        return ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: snapshot.data!.docs.length, // Number of items in the list
          itemBuilder: (context, index) {
            final doc = snapshot
                .data!.docs[index]; // Get the document at the current index
            return _buildMessageItem(
                doc, senderID, theme); // Build each message item
          },
        );
      },
    );
  }

  /// Builds a widget for each message in the chat, including sender's alignment and message formatting.
  Widget _buildMessageItem(
      DocumentSnapshot doc, String senderID, ThemeData theme) {
    Map<String, dynamic> data = doc.data()
        as Map<String, dynamic>; // Get message data from the document

    bool isCurrentUser = data['senderID'] ==
        senderID; // Determine if the message is from the current user
    Timestamp timestamp = data['timestamp']
        as Timestamp; // Extract timestamp from the message data
    DateTime dateTime =
        timestamp.toDate(); // Convert timestamp to DateTime object
    String formattedTime =
        "${dateTime.hour}:${dateTime.minute}"; // Format the message timestamp

    return Align(
      alignment: isCurrentUser
          ? Alignment.centerRight
          : Alignment.centerLeft, // Align message based on sender
      child: Container(
        margin: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 8), // Set margin around the message container
        padding: const EdgeInsets.all(
            12), // Set padding inside the message container
        decoration: BoxDecoration(
          color: isCurrentUser
              ? theme.colorScheme.primary
                  .withOpacity(0.1) // Light color for current user's messages
              : theme.colorScheme.secondary
                  .withOpacity(0.1), // Light color for other user's messages
          borderRadius: BorderRadius.circular(
              12), // Round corners of the message container
        ),
        child: Column(
          crossAxisAlignment: isCurrentUser
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start, // Align text based on sender
          children: [
            Text(
              data['message'] ??
                  'Empty message', // Display the message text or a default message
              style: theme.textTheme.bodyLarge?.copyWith(
                color: isCurrentUser
                    ? theme
                        .colorScheme.primary // Set text color based on sender
                    : theme.colorScheme.secondary,
              ),
            ),
            const SizedBox(
                height: 4), // Space between message text and timestamp
            Text(
              formattedTime, // Display formatted time of the message
              style: theme.textTheme.bodySmall?.copyWith(
                color: Colors.black54, // Set color for the timestamp
                fontSize: 12, // Set font size for the timestamp
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the input field for typing and sending messages.
  Widget _buildMessageInput(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(8), // Padding around the input field
      color: theme
          .scaffoldBackgroundColor, // Background color of the input field container
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController, // Controller for the input field
              decoration: InputDecoration(
                hintText:
                    'Type a message...', // Placeholder text in the input field
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      15), // Round corners of the input field border
                  borderSide: BorderSide(
                      color: theme.colorScheme.primary,
                      width: 0.5), // Border color and width
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      15), // Round corners of the focused input field border
                  borderSide: BorderSide(
                      color: theme.colorScheme.primary,
                      width: 0.75), // Border color and width when focused
                ),
                fillColor: theme
                    .colorScheme.surface, // Background color of the input field
                filled: true, // Fill the input field with the background color
              ),
              style: theme.textTheme.bodyLarge, // Style for the input text
            ),
          ),
          IconButton(
            icon: Icon(Icons.send,
                color: theme.colorScheme.primary), // Send button icon
            onPressed:
                sendMessage, // Call sendMessage when the button is pressed
          ),
        ],
      ),
    );
  }
}
