import 'value_failure.dart';

class UnAuthenticatedError extends Error {}

class UnexpectedValueError<T> extends Error {
  UnexpectedValueError(this.valueFailure);

  final ValueFailure<T> valueFailure;

  @override
  String toString() {
    const explanation = 'Encountered a ValueFailure at an unrecoverable point.';

    return Error.safeToString('$explanation Failure was: $valueFailure');
  }
}
