import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signup( CreateUserReq create_user_req);
  Future<Either> signin(SigninUserReq signin_user_req);
}

class AuthFirebaseServiceImp extends AuthFirebaseService{
  @override
  Future<Either> signin(SigninUserReq signin_user_req) async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: signin_user_req.email, password: signin_user_req.password);
      return const Right(
        'Signin was Successful'
      );
    } on FirebaseAuthException catch (e){
      String message = '';
      if (e.code == 'invalid-email'){
        message = 'Not user found that email';
      }else if (e.code == 'invalid-credential'){
        message ='Wrong password provided for that user';
      }
      return Left(
        message
      );
    }
  }

  @override
  Future<Either> signup(CreateUserReq create_user_req)  async{
    try{
      var data =  await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: create_user_req.email, 
        password: create_user_req.password);
      FirebaseFirestore.instance.collection('Users').add(
        {
          'name' : create_user_req.fullName,
          'email' : data.user?.email,
        }
      );
      return const Right(
        'Signup was Successful'
      );
    } on FirebaseAuthException catch (e){
      String message = '';
      if (e.code == 'weak-password'){
        message = 'The password provided is to weak';
      }else if (e.code == 'email-already-in-use'){
        message ='An account already exist with that email';
      }
      return Left(
        message
      );
    }
  }

} 