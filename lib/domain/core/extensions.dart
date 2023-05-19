import 'package:fpdart/fpdart.dart';

extension ForceLeft<L, R> on Either<L, R> {
  L forceLeft() {
    return fold((l) => l, (r) => throw AssertionError());
  }
}
