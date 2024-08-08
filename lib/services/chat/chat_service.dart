import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample_chat_app/models/message.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Method to get a stream of users from Firestore
  Stream<List<Map<String, dynamic>>> getUsers() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      // Convert Firestore documents to a list of maps
      return snapshot.docs.map((doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();
    });
  }

  // Method to get the receiver's user ID based on their email
  Future<String?> getReceiverID(String email) async {
    try {
      // Query Firestore for a user with the specified email
      final snapshot = await _firestore
          .collection("Users")
          .where("email", isEqualTo: email)
          .get();

      // Check if any user was found
      if (snapshot.docs.isNotEmpty) {
        final user = snapshot.docs.first.data() as Map<String, dynamic>;
        // Return the user's ID
        return user["uid"] as String?;
      } else {
        // No user found
        return null;
      }
    } catch (e) {
      // Print error message and return null
      print("Error fetching receiver ID: $e");
      return null;
    }
  }

  // Method to send a message to a specified receiver
  Future<void> sendMessage(String receiverID, String message) async {
    // Get the current user's ID and email
    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email ?? '';
    // Get the current timestamp
    final Timestamp timestamp = Timestamp.now();

    // Create a new Message object
    Message newMessage = Message(
      senderID: currentUserID,
      senderEmail: currentUserEmail,
      receiverID: receiverID,
      message: message,
      timestamp: timestamp,
    );

    // Create a chat room ID based on sorted user IDs
    List<String> ids = [currentUserID, receiverID];
    ids.sort();
    String chatRoomID = ids.join('_');

    // Add the message to the appropriate chat room
    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .add(newMessage.toMap());
  }

  // Method to get messages from a chat room
  Stream<QuerySnapshot> getMessages(String userID, String otherUserID) {
    // Create a chat room ID based on sorted user IDs
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomID = ids.join('_');

    // Return a stream of messages ordered by timestamp
    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
