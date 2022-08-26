```dart
method = Http.GET

url = "BASE_URL/property/get-by-user"

headers = {
    "user-id" : String
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : [ int, ...]
}
```
