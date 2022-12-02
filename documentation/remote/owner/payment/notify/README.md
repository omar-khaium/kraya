```dart
method = Http.POST

url = "BASE_URL/owner/payment/notify"

header = {
    "tenant-id" : String*,
    "property-id" : int*,
    "month" : String*
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : null
}
```
* means required
