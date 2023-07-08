import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/api/api.dart';

import '../core/api/constance.dart';
import '../data/model/auth/auth_error_model.dart';
import '../data/model/auth/login_request_model.dart';
import '../data/model/auth/register_request_model.dart';
import '../data/model/shop_login_model.dart';

class AuthService {
  final _apiHelper = ApiHelper();

  Future<Either<AuthLoginModel,ShopLoginModel>> login(
      LoginRequestModel loginRequestModel) async {
    final result = await _apiHelper.post(
      url: AppApiConstance.loginURL,
      body: loginRequestModel.toMap(),
      headers: {
        'lang': 'en',
      },
    );
    if(result['status']){
      return Right(ShopLoginModel.fromJson(result));
    }
    return Left(AuthLoginModel.fromJson(result));
  }

  Future<Either<AuthLoginModel,ShopLoginModel>> register (RegisterRequestModel registerRequestModel)async{

    final result = await _apiHelper.post(
      url: AppApiConstance.registerURL,
      body: registerRequestModel.toMap(),
        headers: {'lang':'ar'}
    );
    if(result['status']){
      return Right(ShopLoginModel.fromJson(result));
    }
    return Left(AuthLoginModel.fromJson(result));

  }
}
