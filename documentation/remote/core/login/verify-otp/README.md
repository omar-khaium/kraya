```dart
method = Http.POST

url = "BASE_URL/core/login/verify-otp"

headers = {
  "phone" : String,   // 11 or 14 digit valid phone number
  "otp" : String,     // 6 digit int code
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : {
    "user-id" : "ADFSASD-ASDFASDF-ASDFASD-ADSA",    // user's guid id or empty if new user
  }
}
```
