

import 'package:mockito/annotations.dart';

import '../model/profile.dart';

@GenerateNiceMocks([MockSpec<ProfileLocalDataSource>()])
abstract class ProfileLocalDataSource {
  /// This method is to retrieve last cached profile with this [phone] number
  ///
  /// As firebase phone auth is a separate module than Kraya server,
  /// it is necessary to identify whether OTP verified [phone] number
  /// is an existing account or not in Kraya server.
  /// For existing account, a [ProfileModel] will be returned.
  /// For New user, [Null] will be return instead.
  Future<ProfileModel?> identifiedProfile({required String phone});

  /// Cache retrieved user profile data as [ProfileModel] for future uses.
  /// In case of invalid data argument or wrong data type,
  /// a [CacheException] will be thrown.
  Future<void> cacheProfile({required ProfileModel model});
}
