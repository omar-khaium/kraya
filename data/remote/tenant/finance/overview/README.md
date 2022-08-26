```dart
method = Http.GET

url = "BASE_URL/tenant/finance/overview"

headers = {
    "tenant-id" : String,
    "from" : int,
    "to" : int
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : {
    "total" : int,
    "paid" : int,
    "due" : int
  }
}
```
