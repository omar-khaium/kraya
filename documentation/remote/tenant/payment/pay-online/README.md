```dart
method = Http.POST

url = "BASE_URL/tenant/payment/pay-online"

header = {
    "tenant-id" : String*,
    "bill-id" : int*,
    "amount" : int*
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : null
}
```

* means required