```dart
method = Http.GET

url = "BASE_URL/tenant/add-property/submit"

headers = {
  "tenant-id" : String,
  "property-id": int, // residential, commercial
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : null
}
```
