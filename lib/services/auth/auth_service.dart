import 'package:cloud_firestore/cloud_firestore.dart'; // Import Cloud Firestore package for database operations
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Authentication package

// AuthService class manages authentication operations
class AuthService {
  // Instances of FirebaseAuth and FirebaseFirestore
  final FirebaseAuth _auth =
      FirebaseAuth.instance; // Instance to manage authentication operations
  final FirebaseFirestore _firestore = FirebaseFirestore
      .instance; // Instance to interact with Firestore database

  // Method to get the current user
  User? getCurrentUser() {
    return _auth
        .currentUser; // Returns the currently signed-in user, or null if no user is signed in
  }

  // Method to sign in with email and password
  Future<UserCredential> signInWithEmailPassword(
      String email, String password) async {
    try {
      // Attempts to sign in the user with the provided email and password
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential; // Returns the UserCredential if sign-in is successful
    } on FirebaseAuthException catch (e) {
      // Catches any FirebaseAuthException and throws a new exception with the error code
      throw Exception(e.code);
    }
  }

  // Method to sign up with email and password
  Future<UserCredential> signUpWithEmailPassword(
      String email, String password) async {
    try {
      // Attempts to create a new user with the provided email and password
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Adds user information to Firestore
      await _firestore.collection("Users").doc(userCredential.user!.uid).set({
        'email': email, // Saves the email address
        'uid': userCredential.user!.uid, // Saves the unique user ID
      });

      return userCredential; // Returns the UserCredential if sign-up is successful
    } on FirebaseAuthException catch (e) {
      // Catches any FirebaseAuthException and throws a new exception with the error code
      throw Exception(e.code);
    }
  }

  // Method to sign out the current user
  Future<void> signOut() async {
    await _auth.signOut(); // Signs out the currently signed-in user
  }
}
