import 'package:mockito/annotations.dart';

import '../model/payment.dart';

@GenerateNiceMocks([MockSpec<OwnerPaymentRemoteDataSource>()])
abstract class OwnerPaymentRemoteDataSource {
  Future<List<PaymentModel>> overview();

  Future<bool> notify({required int tenantId, required int propertyId, required DateTime month});
  Future<bool> receivePayment(
      {required int ownerId, required int tenantId, required int propertyId, required DateTime month, required int amount});
}
