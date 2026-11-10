import 'package:equatable/equatable.dart';

/// Kelas representasi kegagalan pada lapisan domain (Domain Failure)
class Failure extends Equatable {
  final String message;
  final int code;

  const Failure({
    required this.message,
    this.code = -1,
  });

  @override
  List<Object?> get props => [message, code];
}

/// Helper pengubah exception menjadi Failure yang aman
class ErrorHandler {
  const ErrorHandler._();

  static Failure handle(Object error) {
    if (error is Failure) {
      return error;
    }
    return Failure(message: error.toString());
  }
}

