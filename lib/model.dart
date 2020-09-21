import 'package:freezed_annotation/freezed_annotation.dart';

part 'model.freezed.dart';

@freezed
abstract class Person with _$Person {
  const factory Person(String name, int age) = _Person;
}