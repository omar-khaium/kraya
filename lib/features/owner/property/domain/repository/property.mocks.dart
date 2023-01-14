// Mocks generated by Mockito 5.3.2 from annotations
// in kraya_backend/features/owner/property/domain/repository/property.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;
import 'dart:io' as _i8;

import 'package:dartz/dartz.dart' as _i2;
import 'package:kraya_backend/core/entity/availabiilty.dart' as _i7;
import 'package:kraya_backend/core/error/failures.dart' as _i5;
import 'package:kraya_backend/features/core/property/domain/entity/bills.dart'
    as _i6;
import 'package:kraya_backend/features/owner/property/domain/repository/property.dart'
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

/// A class which mocks [OwnerPropertyRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockOwnerPropertyRepository extends _i1.Mock
    implements _i3.OwnerPropertyRepository {
  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> add({
    required int? ownerId,
    required int? tenantId,
    required int? typeIdId,
    required int? subTypeId,
    required String? buildingName,
    required String? flatName,
    required String? address,
    required int? size,
    required int? room,
    required int? bathroom,
    required int? balcony,
    required int? advance,
    required int? rent,
    required String? description,
    required List<int>? features,
    required List<_i6.BillEntity>? bills,
    required _i7.AvailabilityEntity? availabilityEntity,
    required List<_i8.File>? pictures,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #add,
          [],
          {
            #ownerId: ownerId,
            #tenantId: tenantId,
            #typeIdId: typeIdId,
            #subTypeId: subTypeId,
            #buildingName: buildingName,
            #flatName: flatName,
            #address: address,
            #size: size,
            #room: room,
            #bathroom: bathroom,
            #balcony: balcony,
            #advance: advance,
            #rent: rent,
            #description: description,
            #features: features,
            #bills: bills,
            #availabilityEntity: availabilityEntity,
            #pictures: pictures,
          },
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
            _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #add,
            [],
            {
              #ownerId: ownerId,
              #tenantId: tenantId,
              #typeIdId: typeIdId,
              #subTypeId: subTypeId,
              #buildingName: buildingName,
              #flatName: flatName,
              #address: address,
              #size: size,
              #room: room,
              #bathroom: bathroom,
              #balcony: balcony,
              #advance: advance,
              #rent: rent,
              #description: description,
              #features: features,
              #bills: bills,
              #availabilityEntity: availabilityEntity,
              #pictures: pictures,
            },
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
                _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #add,
            [],
            {
              #ownerId: ownerId,
              #tenantId: tenantId,
              #typeIdId: typeIdId,
              #subTypeId: subTypeId,
              #buildingName: buildingName,
              #flatName: flatName,
              #address: address,
              #size: size,
              #room: room,
              #bathroom: bathroom,
              #balcony: balcony,
              #advance: advance,
              #rent: rent,
              #description: description,
              #features: features,
              #bills: bills,
              #availabilityEntity: availabilityEntity,
              #pictures: pictures,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, bool>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> edit({
    required int? propertyId,
    required int? ownerId,
    required int? tenantId,
    required int? typeId,
    required int? subTypeId,
    required String? buildingName,
    required String? flatName,
    required String? address,
    required int? size,
    required int? room,
    required int? bathroom,
    required int? balcony,
    required int? advance,
    required int? rent,
    required String? description,
    required List<int>? features,
    required List<_i6.BillEntity>? bills,
    required _i7.AvailabilityEntity? availabilityEntity,
    required List<String>? oldPictures,
    required List<_i8.File>? newPictures,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #edit,
          [],
          {
            #propertyId: propertyId,
            #ownerId: ownerId,
            #tenantId: tenantId,
            #typeId: typeId,
            #subTypeId: subTypeId,
            #buildingName: buildingName,
            #flatName: flatName,
            #address: address,
            #size: size,
            #room: room,
            #bathroom: bathroom,
            #balcony: balcony,
            #advance: advance,
            #rent: rent,
            #description: description,
            #features: features,
            #bills: bills,
            #availabilityEntity: availabilityEntity,
            #oldPictures: oldPictures,
            #newPictures: newPictures,
          },
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
            _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #edit,
            [],
            {
              #propertyId: propertyId,
              #ownerId: ownerId,
              #tenantId: tenantId,
              #typeId: typeId,
              #subTypeId: subTypeId,
              #buildingName: buildingName,
              #flatName: flatName,
              #address: address,
              #size: size,
              #room: room,
              #bathroom: bathroom,
              #balcony: balcony,
              #advance: advance,
              #rent: rent,
              #description: description,
              #features: features,
              #bills: bills,
              #availabilityEntity: availabilityEntity,
              #oldPictures: oldPictures,
              #newPictures: newPictures,
            },
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
                _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #edit,
            [],
            {
              #propertyId: propertyId,
              #ownerId: ownerId,
              #tenantId: tenantId,
              #typeId: typeId,
              #subTypeId: subTypeId,
              #buildingName: buildingName,
              #flatName: flatName,
              #address: address,
              #size: size,
              #room: room,
              #bathroom: bathroom,
              #balcony: balcony,
              #advance: advance,
              #rent: rent,
              #description: description,
              #features: features,
              #bills: bills,
              #availabilityEntity: availabilityEntity,
              #oldPictures: oldPictures,
              #newPictures: newPictures,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, bool>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, bool>> sendBill({
    required int? tenantId,
    required int? propertyId,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #sendBill,
          [],
          {
            #tenantId: tenantId,
            #propertyId: propertyId,
          },
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
            _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #sendBill,
            [],
            {
              #tenantId: tenantId,
              #propertyId: propertyId,
            },
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, bool>>.value(
                _FakeEither_0<_i5.Failure, bool>(
          this,
          Invocation.method(
            #sendBill,
            [],
            {
              #tenantId: tenantId,
              #propertyId: propertyId,
            },
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, bool>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<int>>> allProperties(
          {required int? ownerId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #allProperties,
          [],
          {#ownerId: ownerId},
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, List<int>>>.value(
            _FakeEither_0<_i5.Failure, List<int>>(
          this,
          Invocation.method(
            #allProperties,
            [],
            {#ownerId: ownerId},
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, List<int>>>.value(
                _FakeEither_0<_i5.Failure, List<int>>(
          this,
          Invocation.method(
            #allProperties,
            [],
            {#ownerId: ownerId},
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<int>>>);
}
