// Mocks generated by Mockito 5.3.2 from annotations
// in kraya_backend/features/owner/finance/domain/repository/finance.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:kraya_backend/core/error/failures.dart' as _i5;
import 'package:kraya_backend/features/owner/finance/domain/repository/finance.dart'
    as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [OwnerFinanceRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockOwnerFinanceRepository extends _i1.Mock
    implements _i3.OwnerFinanceRepository {
  @override
  _i4.Future<_i2.Either<_i5.Failure, int>> overview({
    required int? ownerId,
    required DateTime? from,
    required DateTime? to,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #overview,
          [],
          {
            #ownerId: ownerId,
            #from: from,
            #to: to,
          },
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, int>>.value(
            _FakeEither_0<_i5.Failure, int>(
          this,
          Invocation.method(
            #overview,
            [],
            {
              #ownerId: ownerId,
              #from: from,
              #to: to,
            },
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, int>>.value(
                _FakeEither_0<_i5.Failure, int>(
          this,
          Invocation.method(
            #overview,
            [],
            {
              #ownerId: ownerId,
              #from: from,
              #to: to,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, int>>);
}
