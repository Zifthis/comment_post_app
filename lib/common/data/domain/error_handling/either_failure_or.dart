import 'package:comment_post_app/common/data/domain/error_handling/app_failure.dart';
import 'package:dartz/dartz.dart';

typedef EitherAppFailureOr<T> = Future<Either<AppFailure, T>>;
