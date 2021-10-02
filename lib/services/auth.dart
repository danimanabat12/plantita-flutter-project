import 'package:dani_miniproject/models/myUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dani_miniproject/services/auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Creating custom model obj from Firebase User object since we don't want to extract exactly everything from the Firebase User object. 
  myUser? _userFromFirebaseUser(User user) {
    return user != null ? myUser(uid: user.uid, displayName: user.displayName) : null;
  }

  // Stream
  Stream<myUser?> get user {
    return _auth.authStateChanges().map((User? user) => _userFromFirebaseUser(user!));
  }

  // Sign in
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user; 
      return _userFromFirebaseUser(user!); 
    } 
    on FirebaseAuthException catch (e) {
      print(e.code);
      switch(e.code) {
        case 'invalid-email': return 'The email address that you entered is invalid. Please enter a valid one.';
        case 'user-disable': return 'The email address that you entered is currently disabled. Please contact our support desk.';
        case 'user-not-found': return 'The email address that you entered is not registered within the system.';
        case 'wrong-password': return 'Invalid email address/password';
        default: return null;
      }
      // return null;
    }
  }

  // Sign up - Email and Password
  Future registerWithEmailAndPassword(String email, String password, String username) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    }
    on FirebaseAuthException catch (e) {
      switch(e.code) {
        case 'email-already-in-use': return 'Someone is already using that email.';
        case 'invalid-email': return 'The email address that you entered is invalid. Please enter a valid one.';
        case 'operation-not-allowed': return 'This operation is currently disabled. Please contact our support desk.';
        case 'weak-password': return 'The entered password is too weak! Please use a stronger one.';
        default: return null;
      }
    }
  }

  // Log out

  Future logOut() async {
    try {
      return await _auth.signOut();
    }
    on FirebaseAuthException catch (e) {
      return null;
    }
  }

  // Forgot password
  Future sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return 1;
    } 
    on FirebaseAuthException catch (e) {
      print(e.code);
      switch(e.code) {
        case 'invalid-email': return 'The email address that you entered is invalid. Please enter a valid one.';
        case 'user-not-found': return 'User not found. Try registering first.';
        default: return null;
      }
    }
  }
}