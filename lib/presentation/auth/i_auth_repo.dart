import 'package:clean_api/clean_api.dart';
import 'package:nmonybag/domain/app/user_profile.dart';
import 'package:nmonybag/domain/auth/login_body.dart';
import 'package:nmonybag/domain/auth/signUp.dart';

abstract class IAuthRepo {
  Future<Either<CleanFailure, UserProfile>> login(LoginBody body);
  Future<Either<CleanFailure, UserProfile>> registation(SignUpBody body);
}
