```dart
method = Http.GET

url = "BASE_URL/tenant/payment/overview"

header = {
    "tenant-id" : String*
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : [
        {
            "bill-id": int,
            "property-id": int,
            "month": String, // MM/yyyy
            "current-month-amount" : int,
            "due": int
        }
    ]
}
```

* means required