import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/models/auth/create_user_req.dart';
import 'package:spotify/domain/respository/auth/auth.dart';

import '../../../service_locator.dart';

class SignupUseCase implements Usecase< Either ,CreateUserReq> {  
/*Either<L, R> đại diện cho một giá trị có thể là:
 Left<L>: biểu diễn một lỗi hoặc kết quả thất bại, thường là một kiểu dữ liệu mô tả lỗi.
 Right<R>: biểu diễn một kết quả thành công. */
  @override
  Future <Either> call({CreateUserReq ? params}) {
    return sl<AuthRepository>().signup(params!);
  }

}