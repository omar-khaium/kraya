import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';

import '../../../../../core/error/failures.dart';
import '../entity/relation.dart';

@GenerateNiceMocks([MockSpec<RelationRepository>()])
abstract class RelationRepository {
  Future<Either<Failure, List<RelationEntity>>> getAllRelations();
}
