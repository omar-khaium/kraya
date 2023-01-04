import 'package:dartz/dartz.dart';
import 'package:kraya_backend/features/owner/appointment/domain/repository/bank_appointment.mocks.dart';
import 'package:kraya_backend/features/owner/appointment/domain/usecase/add.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  late AddOwnerAppointmentUsecase usecase;
  late MockOwnerAppointmentRepository mockRepository;

  setUp(() {
    mockRepository = MockOwnerAppointmentRepository();
    usecase = AddOwnerAppointmentUsecase(mockRepository);
  });

  final int ownerId = 0;
  final String name = "";
  final String phone = "";
  final String secondPhone = "";
  final String address = "";
  final double latitude = 0.0;
  final double longitude = 0.0;
  final DateTime date = DateTime(2000);

  final bool result = true;

  test("should get this guid from the repository", () async {
    // arrange
    when(
      mockRepository.add(
        ownerId: ownerId,
        name: name,
        phone: phone,
        secondPhone: secondPhone,
        address: address,
        latitude: latitude,
        longitude: longitude,
        date: date,
      ),
    ).thenAnswer((_) async => Right(result));

    // act
    final tResult = await usecase(
      AddOwnerAppointmenParams(
        ownerId: ownerId,
        name: name,
        phone: phone,
        secondPhone: secondPhone,
        address: address,
        latitude: latitude,
        longitude: longitude,
        date: date,
      ),
    );

    // assert
    expect(tResult, Right(result));
    verify(
      mockRepository.add(
        ownerId: ownerId,
        name: name,
        phone: phone,
        secondPhone: secondPhone,
        address: address,
        latitude: latitude,
        longitude: longitude,
        date: date,
      ),
    );
    verifyNoMoreInteractions(mockRepository);
  });
}
