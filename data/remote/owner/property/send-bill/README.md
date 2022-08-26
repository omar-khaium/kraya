```dart
method = Http.POST

url = "BASE_URL/owner/property/send-bill"

headers = {
    "user-id" : String,
    "property-id" : int
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : null
}
```
