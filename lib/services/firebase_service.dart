// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:whatsapp_ui/models/message_model.dart';
// import 'package:whatsapp_ui/models/user_model.dart';

// class FirebaseService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final FirebaseStorage _storage = FirebaseStorage.instance;

//   // Get current user
//   User? get currentUser => _auth.currentUser;

//   // Stream of auth state changes
//   Stream<User?> get authStateChanges => _auth.authStateChanges();

//   // Sign in with email and password
//   Future<UserCredential> signInWithEmailAndPassword(
//     String email,
//     String password,
//   ) async {
//     try {
//       return await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//     } catch (e) {
//       rethrow;
//     }
//   }

//   // Register with email and password
//   Future<UserCredential> registerWithEmailAndPassword(
//     String email,
//     String password,
//     String name,
//   ) async {
//     try {
//       UserCredential userCredential = await _auth
//           .createUserWithEmailAndPassword(email: email, password: password);

//       // Create user profile in Firestore
//       await _firestore.collection('users').doc(userCredential.user!.uid).set({
//         'uid': userCredential.user!.uid,
//         'name': name,
//         'email': email,
//         'profilePic': '',
//         'lastSeen': DateTime.now().toIso8601String(),
//         'isOnline': true,
//       });

//       return userCredential;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   // Sign out
//   Future<void> signOut() async {
//     try {
//       await _auth.signOut();
//     } catch (e) {
//       rethrow;
//     }
//   }

//   // Send message
//   Future<void> sendMessage(MessageModel message) async {
//     try {
//       await _firestore.collection('messages').add(message.toMap());
//     } catch (e) {
//       rethrow;
//     }
//   }

//   // Get messages between two users
//   Stream<List<MessageModel>> getMessages(
//     String currentUserId,
//     String otherUserId,
//   ) {
//     return _firestore
//         .collection('messages')
//         .where('senderId', whereIn: [currentUserId, otherUserId])
//         .where('receiverId', whereIn: [currentUserId, otherUserId])
//         .orderBy('timestamp', descending: true)
//         .snapshots()
//         .map((snapshot) {
//           return snapshot.docs
//               .map((doc) => MessageModel.fromMap(doc.data()))
//               .toList();
//         });
//   }

//   // Update user profile
//   Future<void> updateUserProfile(UserModel user) async {
//     try {
//       await _firestore.collection('users').doc(user.uid).update(user.toMap());
//     } catch (e) {
//       rethrow;
//     }
//   }

//   // Get user profile
//   Stream<UserModel?> getUserProfile(String uid) {
//     return _firestore
//         .collection('users')
//         .doc(uid)
//         .snapshots()
//         .map((doc) => doc.exists ? UserModel.fromMap(doc.data()!) : null);
//   }

//   // Upload profile picture
//   Future<String> uploadProfilePicture(String uid, String filePath) async {
//     try {
//       Reference ref = _storage.ref().child('profile_pictures/$uid');
//       await ref.putFile(File(filePath));
//       return await ref.getDownloadURL();
//     } catch (e) {
//       rethrow;
//     }
//   }
// }
