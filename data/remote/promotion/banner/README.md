```dart
method = Http.GET

url = "BASE_URL/promotion/banner/get"

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : [
    {
        "url" : String,
        "action" : String,
        "expiresAt" : int,
      }
    ], ...
}
```
