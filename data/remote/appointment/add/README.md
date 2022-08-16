```dart
method = Http.POST

url = "BASE_URL/appointment/add"

header = {
    "userId": String,
    "name": String,
    "phone": String,
    "address": String,
    "latitude": double,
    "longitude": double,
    "secondPhone": String,
    "date": int,
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : null
}
```
