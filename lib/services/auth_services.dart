import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  // Google Sign-In
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Start the sign-in process
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? gUser = await googleSignIn.signIn();

      // If the user cancels the sign-in process
      if (gUser == null) {
        print("Google Sign-In canceled");
        return null; // Exit the function gracefully
      }

      // Get authentication details
      final GoogleSignInAuthentication gAuth = await gUser.authentication;

      // Create a new credential for the user
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      // Sign in with Firebase
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print("Google Sign-In failed: $e");
      return null; // Return null if sign-in fails
    }
  }

  // Google Sign-Out (To switch accounts)
  Future<void> signOutGoogle() async {
    try {
      await GoogleSignIn().signOut(); // Sign out from Google
      await FirebaseAuth.instance.signOut(); // Sign out from Firebase
      print("User signed out successfully");
    } catch (e) {
      print("Error signing out: $e");
    }
  }
}
