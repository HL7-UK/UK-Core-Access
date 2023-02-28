### Locating a FHIR Server
It is assumed that Consumers will discover the URLs of FHIR RESTful endpoints from sources including:
- local configuration
- local, regional or national directory services

### capabilities
A Consumer MAY use the [capabilities](https://hl7.org/fhir/R4/http.html#capabilities) interaction to 
retrieve a [CapabilityStatement](https://hl7.org/fhir/R4/capabilitystatement.html) from a Provider
specifying which resource types and interactions are supported by the FHIR endpoint. For example:
```
GET [base]/metadata
```

A Consumer MAY use the CapabilityStatement during implementation to discover the capabilities of a FHIR endpoint provided by a UKCore Access Provider.

A Consumer MAY retrieve the CapabilityStatement at runtime to discover the current capabilities of a FHIR endpoint and 
to adapt to changes in capability. For example:
- a Provider may be experiencing failures within their system so that some capabilities are temporarily unavailable 
- a Provider may start to provide new capabilities

### Patient search
A Consumer MAY use the [Patient search](./patient_index.html#patient-search) capability from a Patient Index Provider to retrieve
a set of Patient resources matching the search criteria. This interaction can be used where the consumer knows some 
demographic details about the individual and needs to find further information related to the individual such as 
additional demographic details and business identifiers (_e.g._ NHS Number).
For example:
```
GET [base]/Patient?birthdate=[date]&family=[name]
```


Similarly, a Consumer MAY use the [Patient search](./clinical_data.html#patient-search) capability from a Clinical Data 
Provider to retrieve a set of Patient resources matching the search criteria.
This interaction can be used where the consumer knows business identifiers for the individual (e.g. NHS Number) and needs 
to find the logical identifier (_i.e._ `id`) for the individual on this FHIR server.
For example:
```
GET [base]/Patient?identifier=[Identifier]
```

### AllergyIntolerance search
A Consumer MAY use the [AllergyIntolerance search](./clinical_data.html#allergyintolerance-search) capability from a 
Clinical Data Provider to retrieve a set of AllergyIntolerance resources matching the search criteria.
This interaction can be used where the consumer knows the logical identifier for the individual (_i.e._ `id`) on this 
FHIR server and needs to find allergies and intolerances related to this individual.
For example:
```
GET [base]/AllergyIntolerance?patient=[id]
```

### Immunization search
A Consumer MAY use the [Immunization search](./clinical_data.html#immunization-search) capability from a Clinical Data
Provider to retrieve a set of Immunization resources matching the search criteria.
This interaction can be used where the consumer knows the logical identifier for the individual (_i.e._ `id`) on this
FHIR server and needs to find immunizations related to this individual.
For example:
```
GET [base]/Immunization?patient=[id]
```

### MedicationStatement search
A Consumer MAY use the [MedicationStatement search](./clinical_data.html#medicationstatement-search) capability from a 
Clinical Data Provider to retrieve a set of MedicationStatement resources matching the search criteria.
This interaction can be used where the consumer knows the logical identifier for the individual (_i.e._ `id`) on this
FHIR server and needs to find medications used by this individual.
For example:
```
GET [base]/MedicationStatement?patient=[id]
```