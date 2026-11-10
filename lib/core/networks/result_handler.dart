import 'package:dartz/dartz.dart';
import 'package:mytask/core/networks/error_handler.dart';

/// Alias tipe data untuk `Either<Failure, T>`
typedef Result<T> = Either<Failure, T>;

/// Alias tipe data untuk `Future<Either<Failure, T>>`
typedef ResultFuture<T> = Future<Either<Failure, T>>;

/// Menjalankan pemanggilan data secara aman dan membungkus hasilnya ke dalam `Either<Failure, T>`
Future<Result<T>> safeDbCall<T>(Future<T> Function() call) async {
  try {
    final result = await call();
    return Right(result);
  } catch (error) {
    return Left(ErrorHandler.handle(error));
  }
}
