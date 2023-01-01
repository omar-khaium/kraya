import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';

import '../../../../../../core/error/failures.dart';
import '../entity/bills.dart';
import '../entity/details.dart';

@GenerateNiceMocks([MockSpec<PropertyRepository>()])
abstract class PropertyRepository {
  Future<Either<Failure, PropertyDetailsEntity>> details({required int id});
  Future<Either<Failure, PropertyBillsEntity>> bills({required int id});
}
