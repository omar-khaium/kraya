```dart
method = Http.POST

url = "BASE_URL/owner/payment/receive-payment"

header = {
    "owner-id" : String*,
    "tenant-id" : String*,
    "property-id" : int*,
    "month" : String*,
    "amount" : int*
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : null
}
```

* means required