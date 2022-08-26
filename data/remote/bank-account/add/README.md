```dart
method = Http.POST

url = "BASE_URL/bank-account/add"

header = {
    "userId": String,
    "bankId": int,
    "name": String,
    "number": String,
    "branch": String,
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : null
}
```
