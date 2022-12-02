```dart
method = Http.POST

url = "BASE_URL/tenant/payment/send-note"

header = {
    "bill-id" : int*,
    "tenant-id" : String*,
    "property-id" : int*,
    "note" : String*,
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : null,
}
```

* means required