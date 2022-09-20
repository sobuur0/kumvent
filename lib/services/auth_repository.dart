import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:kumvent/constants/enums.dart';
import 'package:kumvent/exception_handler.dart';
import 'package:kumvent/models/user_model.dart';

class FireBaseAuthHelper {
  final _auth = FirebaseAuth.instance;
  late NetworkResultStatus _status;
  final User? _user = FirebaseAuth.instance.currentUser;
  final UserModel _userModel = UserModel();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<NetworkResultStatus> createAccount(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        _status = NetworkResultStatus.successful;
      } else {
        _status = NetworkResultStatus.undefined;
      }
    } catch (e) {
      log('Exception @createAccount: $e');
      _status = AuthExceptionHandler.handleException(e);
    }
    return _status;
  }

  Future<NetworkResultStatus> loginUser(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user != null) {
        _status = NetworkResultStatus.successful;
      } else {
        _status = NetworkResultStatus.undefined;
      }
    } catch (e) {
      log('Exception @loginUser: $e');
      _status = AuthExceptionHandler.handleException(e);
    }
    return _status;
  }

  Future logoutUser() async {
    await _auth.signOut();
  }

  Future<NetworkResultStatus> sendDetailsToFirestore(String fullName) async {
    try {
      _userModel.email = _user!.email;
      _userModel.fullName = fullName;
      _userModel.uid = _user!.uid;

      await _firebaseFirestore
          .collection('users')
          .doc(_user!.uid)
          .set(_userModel.toMap());

      //check firebasefirestore to make sure the data has ben sent
      //this code is incorrect
      if (_user!.email != null) {
        _status = NetworkResultStatus.successful;
      } else {
        _status = NetworkResultStatus.undefined;
      }
      //
    } catch (e) {
      log('Exception @loginUser: $e');
      _status = AuthExceptionHandler.handleException(e);
    }
    return _status;
  }

  Future getDetailsFromFirestore() async {
    try {
      await _firebaseFirestore.collection("users").doc(_user!.uid).get();
    } catch (e) {
      log('Exception @loginUser: $e');
      _status = AuthExceptionHandler.handleException(e);
    }
    // return;
  }
}
