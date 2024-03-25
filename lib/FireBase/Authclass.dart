import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:college_banha_app/Models/UserModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore stor = FirebaseFirestore.instance;



  registerWithEmailAndPassword(Users user, {required String password}) async
  {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
      email: user.email, password: password,);
  }

  signInWithEmailAndPassword(
      {required String email, required String password}) async
  {
    UserCredential user= await auth.signInWithEmailAndPassword(email: email, password: password);
  }

  signOut()async{
    await auth.signOut();
  }

}