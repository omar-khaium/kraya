```dart
method = Http.POST

url = "BASE_URL/owner/appointment/add"

header = {
    "owner-id": String*,
    "name": String*,
    "phone": String*,
    "address": String*,
    "latitude": double*,
    "longitude": double*,
    "second-phone": String*,
    "date": int*,
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : null
}
```

* means required