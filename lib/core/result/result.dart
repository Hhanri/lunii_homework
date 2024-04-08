import 'package:equatable/equatable.dart';

abstract class Result extends Equatable {

  const Result();

}

final class Empty extends Equatable {

  const Empty();

  @override
  List<Object?> get props => [];

}

base class Success<T> extends Result {

  final T value;
  const Success({
    required this.value,
  });

  @override
  List<Object?> get props => [value];

}

typedef EmptySuccess = Success<Empty>;

base class Failure extends Result {

  final int? code;
  final String message;
  const Failure({
    this.code,
    required this.message,
  });

  @override
  List<Object?> get props => [code, message];

}