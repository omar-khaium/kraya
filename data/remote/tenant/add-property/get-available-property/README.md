```dart
method = Http.GET

url = "BASE_URL/tenant/add-property/get-available-property"

headers = {
  "keyword" : String,
  "property-type": Enum, // residential, commercial
  "property-sub-type": Enum, // shop, office, building
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : [ int, ...]
}
```
