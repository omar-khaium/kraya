```dart
method = Http.GET

url = "BASE_URL/owner/finance/overview"

headers = {
    "owner-id" : String,
    "from" : int,
    "to" : int
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : int
}
```
