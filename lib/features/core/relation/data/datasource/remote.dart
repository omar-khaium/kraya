import 'package:mockito/annotations.dart';

import '../model/relation.dart';

@GenerateNiceMocks([MockSpec<RelationRemoteDataSource>()])
abstract class RelationRemoteDataSource {
  Future<List<RelationModel>> getAllRelations();
}