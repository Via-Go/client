import 'package:fpdart/fpdart.dart';

import '../core/value_failure.dart';
import '../core/value_objects.dart';
import '../core/value_validators.dart';

class EmailAddress extends ValueObject<String> {
  factory EmailAddress(String input) {
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value);
  @override
  final Either<ValueFailure<String>, String> value;
}

class Password extends ValueObject<String> {
  factory Password(String input) {
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}

class Username extends ValueObject<String> {
  factory Username(String input) {
    return Username._(
      validateUsername(input),
    );
  }

  const Username._(this.value);

  @override
  final Either<ValueFailure<String>, String> value;
}
