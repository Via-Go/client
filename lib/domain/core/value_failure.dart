import 'package:freezed_annotation/freezed_annotation.dart';
part 'value_failure.freezed.dart';

@freezed
class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.empty({
    required T failedValue,
  }) = Empty<T>;

  const factory ValueFailure.invalidEmail({
    required T failedValue,
  }) = InvalidEmail<T>;

  const factory ValueFailure.invalidPassword({
    required T failedValue,
  }) = InvalidPassword<T>;

  const factory ValueFailure.invalidUsername({
    required T failedValue,
  }) = InvalidUsername<T>;
}
