```dart
method = Http.GET

url = "BASE_URL/owner/payment/overview"

header = {
    "owner-id" : String,
    "month" : String, // MM/yyyy
    "keyword" : String,
    "property-type" : PropertyType,
    "property-sub-type" : PropertySubType,
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : [
        {
            "bill-id": int,
            "property-id": int,
            "status": PaymentStatus,
            "amount": int,
            "payment-date": int or null,
        }
    ]
}
```
