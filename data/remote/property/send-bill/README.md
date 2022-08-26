```dart
method = Http.POST

url = "BASE_URL/property/send-bill"

headers = {
    "user-id" : String,
    "propertyId" : int
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : null
}
```
