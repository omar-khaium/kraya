```dart
method = Http.POST (MULTI-PART/form-data)

url = "BASE_URL/tenant/profile/update"

headers = {
    "tenant-id" : String*,
    "nid-number" : String*,
    "passport-number" : String,
    "email" : String,
    "religion" : Religion,
    "father-name" : String,
    "permanent-address" : String,
    "occupation" : String,
    "job-address" : String,
}
body = {
    "nid-photo" : <File(images/.*)>
}


response = {
  "success" : true,   // boolean
  "error" : null,     // null for successive call or string message while encountering error,
  "result" : null
}
```

* means required