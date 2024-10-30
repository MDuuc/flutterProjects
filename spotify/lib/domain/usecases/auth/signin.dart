import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/data/models/auth/signin_user_req.dart';
import 'package:spotify/domain/respository/auth/auth.dart';

import '../../../service_locator.dart';

class SigninUseCase implements Usecase< Either ,SigninUserReq> {  
/*Either<L, R> đại diện cho một giá trị có thể là:
 Left<L>: biểu diễn một lỗi hoặc kết quả thất bại, thường là một kiểu dữ liệu mô tả lỗi.
 Right<R>: biểu diễn một kết quả thành công. */
  @override
  Future <Either> call({SigninUserReq ? params}) {
    return sl<AuthRepository>().signin(params!);
  }

}