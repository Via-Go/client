import 'value_failure.dart';

class UnAuthenticatedError extends Error {}

class UnexpectedValueError extends Error {
  UnexpectedValueError(this.valueFailure);

  final ValueFailure valueFailure;

  @override
  String toString() {
    const explanation = "Encountered a ValueFailure at an unrecoverable point.";

    return Error.safeToString('$explanation Failure was: $valueFailure');
  }
}
