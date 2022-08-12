```dart
method = Http.POST

url = "BASE_URL/login/verify-otp"

headers = {
  "phone" : "11 or 14 digit valid phone number",
  "otp" : "6 digit int code",
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encounterning error,
  "result" : {
    "user-id" : "123456789",    // user's unique id
  }
}
```
