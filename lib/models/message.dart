import 'package:cloud_firestore/cloud_firestore.dart';

/// A class representing a chat message.
///
/// This class is used to model a message between users, including sender and receiver details,
/// the content of the message, and the timestamp of when the message was sent.
class Message {
  final String senderID; // ID of the user who sent the message
  final String senderEmail; // Email of the user who sent the message
  final String receiverID; // ID of the user who received the message
  final String message; // Content of the message
  final Timestamp timestamp; // Timestamp of when the message was sent

  /// Constructor for the [Message] class.
  ///
  /// Initializes all fields for the message object.
  Message({
    required this.senderID,
    required this.senderEmail,
    required this.receiverID,
    required this.message,
    required this.timestamp,
  });

  /// Converts the [Message] instance to a map.
  ///
  /// This method is useful for storing the message data in Firestore.
  Map<String, dynamic> toMap() {
    return {
      'senderID': senderID,
      'senderEmail': senderEmail,
      'receiverID': receiverID,
      'message': message,
      'timestamp': timestamp,
    };
  }

  /// Creates a [Message] instance from a map.
  ///
  /// This method is used to create a [Message] object from data retrieved from Firestore.
  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      senderID: map['senderID'] ??
          '', // Default to an empty string if 'senderID' is null
      senderEmail: map['senderEmail'] ??
          '', // Default to an empty string if 'senderEmail' is null
      receiverID: map['receiverID'] ??
          '', // Default to an empty string if 'receiverID' is null
      message: map['message'] ??
          '', // Default to an empty string if 'message' is null
      timestamp: map['timestamp'] ??
          Timestamp
              .now(), // Default to the current timestamp if 'timestamp' is null
    );
  }
}
