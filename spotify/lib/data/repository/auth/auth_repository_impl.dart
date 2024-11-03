import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';
import 'package:spotify/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/domain/respository/auth/auth.dart';

import '../../../service_locator.dart';


class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signin(SigninUserReq signin_user_req) async{
   return await sl<AuthFirebaseService>().signin(signin_user_req);
  }

  @override
  Future<Either> signup(CreateUserReq create_user_req) async {
    return await sl<AuthFirebaseService>().signup(create_user_req);
  }

}