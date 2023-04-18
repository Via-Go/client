import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'errors.dart';
import 'value_failure.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  T getOrCrash() {
    return value.fold(
          (l) => throw UnexpectedValueError(l),
      id,
    );
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(covariant ValueObject<T> other) {
    if (identical(this, other)) {
      return true;
    }

    return other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'ValueObject(value: $value)';
}
