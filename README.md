||======================================================================||
||                                                                      ||
|| build_runner:                                                        ||
||   dart run build_runner build --delete-conflicting-outputs           ||
||                                                                      ||
||======================================================================||

__________________________________________________________________________
__________________________________________________________________________
__________________________________________________________________________


||======================================================================||
||                                                                      ||
||                                  TDD                                 ||
||                                                                      ||
||======================================================================||


||======================================================================||
||                          Folder Structure                            ||
||======================================================================||
 - core
 - features
    - ...
    - <name>
        - data
            - model
            - datasource
            - repository
        - domain
            - entity
            - usecases
            - repository
        - presentation
            - bloc
            - pages
            - widgets
__________________________________________________________________________


||======================================================================||
||                               Step 1                                 ||
||======================================================================||
Let's create an abstract failure for the feature.

[Create] a file named failure in the error folder under core module.

example:
path: core/error/failures.dart

abstract class Failure extends Equatable {
  Failure([String? message]);
}

This failure class is only to catch all possible e
rror state like, validation failure, InternetConnectivityFailure,
HttpFailure, etc.
=========================

[Create] a file named exception in the error folder under core module.

example:
path: core/error/exceptions.dart

class ServerException implements Exception {}
class NotFoundException implements Exception {}
// write more exception in later phase depending on demand

=========================

Now, we need to create a Usecase template to work with Usecase.

[Create] an abstract class in the core folder for all usecases.

example:
path: core/usecase.dart

abstract class Usecase<Type, Param>  {
  Future<Either<Failure, Type>> call(Param param);
}
=========================

[Create] a fixture reader function inside test/fixtures 

example:
path: test/fixtures/reader.dart

String fixture(String name) => File("test/fixtures/$name").readAsStringSync();
=========================

[Create] a network info abstract class in core 

example:
path: core/network/info.dart

abstract class NetworkInfo implements DataConnectionChecker {
  Future<bool> get online;
}
__________________________________________________________________________


||======================================================================||
||  DOMAIN                      Step 2                                  ||
||======================================================================||

xxxxxxxxxxxx
x   2.1    x
xxxxxxxxxxxx
In the domain layer, look for the json response 
or data structure of the entity.

[Create] a entity with the desired properties 
to provide to presentation layer.

example:
path: <feature-name>/domain/entity/<entity-name>.dart

class <Name>Entity extends Equatable {
    final int property_1;

    <Name>Entity({required this.property_1});

    @override
    List<Object?> get props => [property_1];
}
__________________________________________________________________________
xxxxxxxxxxxx
x   2.2    x
xxxxxxxxxxxx

Now, create a repository in the entity folder 
by mentioning all usecases of this feature.

example:
path: <feature-name>/domain/repository/<name>.dart

abstract class <Name>Repository {
  Future<Either<Failure, <Name>Entity>> <usecase-name>(params...);
}
__________________________________________________________________________

|----------------------------------------------------------------------|
|  TEST                                                                |
|----------------------------------------------------------------------|
xxxxxxxxxxxx
x   2.3    x
xxxxxxxxxxxx

Now we as mentioned a usecase, let's create a 
test file for the usecase.

[Create] a file in test folder for the usecase.

example:
path: test/.../domain/usecase/<usecase-name>_test.dart

@GenerateNiceMocks([MockSpec<<Name>Repository>()])
void main(){
    late <UsecaseName>Usecase usecase;
    late Mock<RepositoryName>Repository mockRepository;

    setUp(() {
        mockRepository = Mock<RepositryName>Repository();
        usecase = <UsecaseName>Usecase(repository: mockRepository);
    });

    // write your tests here
}
__________________________________________________________________________
xxxxxxxxxxxx
x   2.4    x
xxxxxxxxxxxx

Now, <UsecaseName>Usecase doesn't exists yet, so let's create a usecase in the domain.

[Create] a class by extending from Usecase<Type, Param> at core/usecase.dart

example:
path: <feature-name>/domain/usecase/<usecase-name>.dart

class <UsecaseName>Usecase implements Usecase<<Name>Entity, <<Name>Params>> {
  final <Name>Repository repository;

  <UsecaseName>Usecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, <Name>Entity>> call(<Name>Params params) async {
    return await repository.<usecase-name>(params: param);
  }
}
__________________________________________________________________________
xxxxxxxxxxxx
x   2.5    x
xxxxxxxxxxxx

Repeat step 2.3 and 2.4 for all the usecases inside entity/repository
__________________________________________________________________________


||======================================================================||
||  DATA                         Step 3                                 ||
||======================================================================||

[Domain] layer is finished for now. Next task in hand is to manage a model
to generate a similar entity.

|----------------------------------------------------------------------|
|  TEST                                                                |
|----------------------------------------------------------------------|
xxxxxxxxxxxx
x   3.1    x
xxxxxxxxxxxx

To generate a model, we need to create a test file first.

[create] a test file for the model.

example:
path: test/.../data/model/<model-name>_test.dart

void main(){
    // write your tests here
}
__________________________________________________________________________
xxxxxxxxxxxx
x   3.2    x
xxxxxxxxxxxx

To test a model, we need to have an actual model implementation in the data/model

[Create] a model in with proper properties

example:
path: <feature-name>/data/model/<model-name>.dart

class <Name>Model extends <Name>Entity {
    final int property_1;

    <Name>Model({required this.property_1}) : super(...);
}
__________________________________________________________________________
xxxxxxxxxxxx
x   3.3    x
xxxxxxxxxxxx

[Create] proper .json files inside test/fixtures for testing the newly
created model's fromJson, toJson and all other data class.

// write your tests to verify all cases related with json response 
// of this model
__________________________________________________________________________
xxxxxxxxxxxx
x   3.4    x
xxxxxxxxxxxx

[Create] an implementation of entity/repository to define
and override all usecase

example:
path: <feature-name>/data/repository/<repository-name>_impl.dart

class <RepositoryName>RepositoryImpl extends <RepositoryName>Repository {
  @override
  Future<Either<Failure, <Name>Entity> <usecase-name>(<Name>Params params) {
    // TODO: implement <usecase name>
    throw UnimplimentedException();
  }
}
__________________________________________________________________________
xxxxxxxxxxxx
x   3.5    x
xxxxxxxxxxxx

To work with the repository implementation, we need to define a datasource

example:
path: <feature-name>/data/datasource/<datasource-name>.dart

abstract class <DataSourceName>DataSource {
  @override
  Future<<Name>Model> <usecase-name>(<Name>Params params) {
    // TODO: implement <usecase name>
    throw UnimplimentedException();
  }
}
__________________________________________________________________________
xxxxxxxxxxxx
x   3.6    x
xxxxxxxxxxxx

If you have more than one datasource, 
declare all datasource by repeating only 3.5 untill done.
__________________________________________________________________________

|----------------------------------------------------------------------|
|  TEST                                                                |
|----------------------------------------------------------------------|
xxxxxxxxxxxx
x   3.7    x
xxxxxxxxxxxx

As we are already working with datasource, for the sake of remote data source,
we have ensure, we are online or connected with internet when fetching or
saving data from or to server. Therefore, we need to test the [NetworkInfo]

[create] a test file for the [NetworkInfo].

example:
path: test/core/network/info_test.dart

@GenerateNiceMocks([MockSpec<DataConnectionChecker>()])
void main(){
  NetworkInfoImpl networkInfo;
  MockDataConnectionChecker mockDataConnectionChecker;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    networkInfo = NetworkInfoImpl(dataConnectionChecker: mockDataConnectionChecker);
  });

  // write your tests here
}
__________________________________________________________________________
xxxxxxxxxxxx
x   3.8    x
xxxxxxxxxxxx

We don't have an implementation of [NetworkInfoImpl] as of now,
let's [create] an implementation of [NetworkInfoImpl]

example:
path: core/network/info.dart

class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfoImpl({
    required this.connectionChecker,
  });

  @override
  Future<bool> get online => connectionChecker.hasConnection;
}
__________________________________________________________________________

|----------------------------------------------------------------------|
|  TEST                                                                |
|----------------------------------------------------------------------|
xxxxxxxxxxxx
x   3.8    x
xxxxxxxxxxxx

After setting up all the necessary datasource, we need to create a test 
file for the repository implementation of data layer

[create] a test file for the repository.

example:
path: test/.../data/repository/<repository-name>_impl_test.dart

@GenerateNiceMocks([MockSpec<<DataSourceName>DataSource>()])
...
@GenerateNiceMocks([MockSpec<NetworkInfo>()])
void main(){
  late <RepositoryName>RepositoryImpl repository;
  late Mock<DataSourceName>DataSource mockDataSource;
  ...
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockDataSource = Mock<DataSourceName>DataSource;
    ....
    mockNetworkInfo = MockNetworkInfo();
    repository = <RepositoryName>RepositoryImpl(
      datasource: mockDataSource,
      ...
    );
  });

  // write your tests here
}
__________________________________________________________________________

|----------------------------------------------------------------------|
|  TEST                                                                |
|----------------------------------------------------------------------|
xxxxxxxxxxxx
x   3.9    x
xxxxxxxxxxxx

We didn't test our declared datasource yet. So let's test the datasource.


example:
path: test/.../data/datasource/<datasource-name>_test.dart

@GenerateNiceMocks([MockSpec<http.Client>()])
...
@GenerateNiceMocks([MockSpec<NetworkInfo>()])
void main(){
  late <DataSourceName>DataSourceImpl datasource;
  late MockClient mockClient;
  ...
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockClient = MockClient();
    datasource = <DataSourceName>DataSourceImpl(client: mockClient);
  });

  // write your tests here
}

But, [<DataSourceName>DataSourceImpl] doesn't exists yet. 
So let create the implementation of [<DataSourceName>DataSourceImpl].

example:
path: <feature-name>/data/datasource/<data-source-name>.dart

class <DataSourceName>DataSourceImpl implements <DataSourceName>DataSource {
  final http.Client client;

  <DataSourceName>DataSourceImpl({
    required this.client,
  });

  @override
  Future<<Name>Model> <usecase-name>(<Name>Params params) {
    // TODO: implement <usecase-name>
    throw UnimplimentedException();
  }

  ...
}
__________________________________________________________________________

|----------------------------------------------------------------------|
|  TEST                                                                |
|----------------------------------------------------------------------|
xxxxxxxxxxxx
x   3.10    x
xxxxxxxxxxxx

Let's finish up with datasources by repeating step 3.9 for all other usecases.
__________________________________________________________________________





||======================================================================||
||                              Next12Step                              ||
||======================================================================||
<write here...>
__________________________________________________________________________
