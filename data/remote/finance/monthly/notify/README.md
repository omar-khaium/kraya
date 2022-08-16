```dart
method = Http.POST

url = "BASE_URL/finance/monthly/notify"

header = {
    "tenantId" : String,
    "propertyId" : int,
    "month" : String,
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : null
}
```
