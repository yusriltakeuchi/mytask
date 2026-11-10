import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Cubit dengan siklus hidup aman (lifecycle-safe) yang mencegah emisi state setelah Cubit ditutup (closed).
///
/// Mengadopsi standar arsitektur FuelMeter dan FleetGuard Mobile.
abstract class SafeCubit<State> extends Cubit<State> {
  SafeCubit(super.initialState);

  @override
  void emit(State state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    debugPrint('[$runtimeType] onError: $error');
    debugPrint('StackTrace: $stackTrace');
    super.onError(error, stackTrace);
  }

  /// Memancarkan state dari pemanggilan asinkron secara aman.
  Future<void> safeEmit(Future<State> Function() stateGetter) async {
    try {
      final state = await stateGetter();
      if (!isClosed) {
        emit(state);
      }
    } catch (e, stackTrace) {
      debugPrint('[$runtimeType.safeEmit] Exception: $e');
      debugPrint('StackTrace: $stackTrace');
      if (!isClosed) {
        rethrow;
      }
    }
  }
}

