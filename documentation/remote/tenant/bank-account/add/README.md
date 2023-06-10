```dart
method = Http.POST

url = "BASE_URL/tenant/bank-account/add"

header = {
    "tenant-id": String*,
    "bank-id": int*,
    "name": String*,
    "number": String*,
    "branch": String,
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : null
}
```

* means required