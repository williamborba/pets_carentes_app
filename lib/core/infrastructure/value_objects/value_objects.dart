import '../failures/core_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ValueObject<T> {
  Either<CoreFailure, T> get value;

  T getOrCrash() {
    return value.fold((failure) => throw Exception(failure), id);
  }

  Either<CoreFailure, bool> get trueOrFailure {
    return value.fold(
      (l) => left(l),
      (r) => right(true),
    );
  }
}

@immutable
class IdValueObject extends ValueObject<int?> {
  @override
  final Either<CoreFailure, int?> value;

  IdValueObject._(this.value);

  factory IdValueObject({int? id}) {
    return IdValueObject._(Right(id));
  }
}
