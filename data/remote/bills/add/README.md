```dart
method = Http.POST

url = "BASE_URL/bills/add"

headers = {
    "user-id" : String,
    "propertyId" : int,
    "name": String,
    "amount": int,
    "extra": int
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : null
}
```
