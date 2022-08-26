```dart
method = Http.GET

url = "BASE_URL/tenant/all-properties"

headers = {
    "tenant-id" : String
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : [ int, ...]
}
```
