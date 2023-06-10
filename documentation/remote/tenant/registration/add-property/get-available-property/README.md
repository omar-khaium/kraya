```dart
method = Http.GET

url = "BASE_URL/tenant/registration/add-property/get-available-property"

headers = {
  "keyword" : String*,
  "property-type": PropertyType
  "property-sub-type": PropertySubType
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : [ int, ...]
}
```

* means required