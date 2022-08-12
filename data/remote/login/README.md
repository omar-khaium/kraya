```dart
method = Http.POST

url = "BASE_URL/login/generate-otp"

headers = {
  "phone" : "11 or 14 digit valid phone number",
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encounterning error,
  "result" : {
    "message" : "A 6 digit OTP code is sent to your phone number",
  }
}
```
