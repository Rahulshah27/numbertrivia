import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/core/util/input_converter.dart';

void main() {
  InputConverter inputConverter;

  setUp(() {
    inputConverter = InputConverter();
  });

  group('stringToUnsignedString', () {
    test(
      'should return an integer when the string represents a unsigned integer',
      () async {
        // arrange
        final str = '123';
        // act
        final result = inputConverter.stringToUnsignedInteger(str);
        // assert
        expect(result, Right(123));
      },
    );

    test(
      'should return a Failure when the string is not an integer',
      () async {
        final str = 'abc';
        final result = inputConverter.stringToUnsignedInteger(str);
        expect(result, Left(InvalidInputFailure()));
      },
    );

    test(
      'should return a Failure when the string is not an negative integer',
      () async {
        final str = '-123';
        final result = inputConverter.stringToUnsignedInteger(str);
        expect(result, Left(InvalidInputFailure()));
      },
    );
  });
}
