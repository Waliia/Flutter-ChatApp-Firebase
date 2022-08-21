import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
Future<User?> loginWithEmailAndPassword(String email, String password) async {
  UserCredential userCredential =
      await auth.signInWithEmailAndPassword(email: email, password: password);
  User? user = userCredential.user;
  return Future(() => user);
}

Future<void> sendNameToFirebase(
    String name, String uid, String email, String password) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  await firestore
      .collection('users')
      .doc(uid)
      .set({'name': name, 'uid': uid, 'e-mail': email, 'password': password});
}

Future<User?> registerWithEmailAndPassword(
    String email, String password, String name) async {
  UserCredential credential = await auth.createUserWithEmailAndPassword(
      email: email, password: password);
  User? user = credential.user;
  if (user != null) {
    await sendNameToFirebase(name, user.uid, email, password);
  }
  return Future(() => credential.user);
}

Future<void> forgotPassword(String email) async {
  return await auth.sendPasswordResetEmail(email: email);
}

Future signout() async {
  await auth.signOut();
}
