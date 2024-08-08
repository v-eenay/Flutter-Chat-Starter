import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../services/auth/auth_service.dart';
import '../services/chat/chat_service.dart';

class ChatPage extends StatefulWidget {
  final String receiverEmail;

  ChatPage({super.key, required this.receiverEmail});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  String? _receiverID;

  @override
  void initState() {
    super.initState();
    _fetchReceiverID();
  }

  Future<void> _fetchReceiverID() async {
    final receiverID = await _chatService.getReceiverID(widget.receiverEmail);
    setState(() {
      _receiverID = receiverID;
    });
  }

  void sendMessage() async {
    if (_messageController.text.isNotEmpty && _receiverID != null) {
      await _chatService.sendMessage(_receiverID!, _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.receiverEmail),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
      ),
      body: Column(
        children: [
          Expanded(
            child: _receiverID == null
                ? Center(
                    child: CircularProgressIndicator(
                        color: theme.colorScheme.secondary))
                : _buildMessagesList(theme),
          ),
          _buildMessageInput(theme)
        ],
      ),
    );
  }

  Widget _buildMessagesList(ThemeData theme) {
    final String? senderID = _authService.getCurrentUser()?.uid;
    if (senderID == null || _receiverID == null) {
      return Center(
          child: Text('Unable to load messages',
              style: theme.textTheme.bodyLarge));
    }

    return StreamBuilder(
        stream: _chatService.getMessages(senderID, _receiverID!),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
                child: Text('Error loading messages',
                    style: theme.textTheme.bodyLarge));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
                    color: theme.colorScheme.secondary));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
                child:
                    Text('No messages yet', style: theme.textTheme.bodyLarge));
          }
          return ListView(
            reverse: true, // Ensures new messages appear at the bottom
            padding: const EdgeInsets.symmetric(vertical: 8),
            children: snapshot.data!.docs
                .map((doc) => _buildMessageItem(doc, senderID, theme))
                .toList(),
          );
        });
  }

  Widget _buildMessageItem(
      DocumentSnapshot doc, String senderID, ThemeData theme) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    bool isCurrentUser = data['senderID'] == senderID;
    Timestamp timestamp = data['timestamp'] as Timestamp;
    DateTime dateTime = timestamp.toDate();
    String formattedTime = "${dateTime.hour}:${dateTime.minute}";

    return Align(
      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isCurrentUser
              ? theme.colorScheme.primary.withOpacity(0.1)
              : theme.colorScheme.secondary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment:
              isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              data['message'] ?? 'Empty message',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: isCurrentUser
                    ? theme.colorScheme.primary
                    : theme.colorScheme.secondary,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              formattedTime,
              style: theme.textTheme.bodySmall?.copyWith(
                color: Colors.black54,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageInput(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: theme.scaffoldBackgroundColor,
      child: Row(children: [
        Expanded(
          child: TextField(
            controller: _messageController,
            decoration: InputDecoration(
              hintText: 'Type a message...',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: theme.colorScheme.primary),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: theme.colorScheme.primary, width: 2),
              ),
              fillColor: theme.colorScheme.surface,
              filled: true,
            ),
            style: theme.textTheme.bodyLarge,
          ),
        ),
        IconButton(
          icon: Icon(Icons.send, color: theme.colorScheme.primary),
          onPressed: sendMessage,
        ),
      ]),
    );
  }
}
