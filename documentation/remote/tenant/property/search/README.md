```dart
method = Http.GET

url = "BASE_URL/tenant/property/search"

headers = {
    "keyword" : String*,
    "property-type" : PropertyType,
    "property-sub-type" : PropertySubType
}

response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : [ int, ...]
}
```

* means required