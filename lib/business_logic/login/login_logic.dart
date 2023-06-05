abstract class Login {
   Future<void> generateOtp(String phone);
   Future<void> resendOtp(String phone);
   Future<bool> verifyOtp(String phone);
}