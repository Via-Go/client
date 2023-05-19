import 'package:fpdart/fpdart.dart';

extension ForceLeft<L, R> on Either<L, R> {
  L forceLeft() {
    return fold((l) => l, (r) => throw AssertionError());
  }
}

extension ForceRight<L, R> on Either<L, R> {
  R forceRight() {
    return fold((l) => throw AssertionError(), (r) => r);
  }
}
