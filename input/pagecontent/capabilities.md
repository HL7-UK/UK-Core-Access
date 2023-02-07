### Determine Provider capabilities
The Provider SHALL support the [capabilities](https://hl7.org/fhir/R4/http.html#capabilities) interaction so that
a Consumer can retrieve a [CapabilityStatement](https://hl7.org/fhir/R4/capabilitystatement.html) resource that 
specifies which resource types and interactions are supported by the FHIR endpoint:
```
GET [base]/metadata
```

> TODO: how to interpret the capabilities ...

### Find a patient
The Provider SHALL support the [search](https://hl7.org/fhir/R4/http.html#search) interaction on the 
[Patient](https://hl7.org/fhir/R4/patient.html) resource so that a Consumer can retrieve a set of Patient resources
matching the search criteria and conforming to the [UKCore Patient](https://simplifier.net/guide/uk-core-implementation-guide/Home/ProfilesandExtensions/ProfileUKCore-Patient?version=1.0.0) profile.





> TODO: Relation to PDQm as a subset?

#### Find a patient by identifier
The Provider SHALL support the `identifier` search parameter.
See [token](https://www.hl7.org/fhir/R4/search.html#token) for details on use of the `identifier` parameter.

> TODO: Behaviour if unsupported identifier system? 400 | OperationOutcome | empty?

##### Find a patient by NHS Number
The national identifier within England, Wales and the Isle of Man is the [NHS Number](https://digital.nhs.uk/data-and-information/information-standards/information-standards-and-data-collections-including-extractions/publications-and-notifications/standards-and-collections/isb-0149-nhs-number)
which uses the identifier system `https://fhir.nhs.uk/Id/nhs-number`.

The Provider MAY support search by NHS Number:
```
GET [base]/Patient?identifier=https://fhir.nhs.uk/Id/nhs-number|[NHS Number]
```
For example:
```
GET [base]/Patient?identifier=https://fhir.nhs.uk/Id/nhs-number|4123456789

Return all Patient resources with NHS Number of 4123456789.
```

##### Find a patient by CHI Number
The national identifier within Scotland is the [CHI Number](https://www.ndc.scot.nhs.uk/Dictionary-A-Z/Definitions/index.asp?ID=128)
which uses the identifier system `https://fhir.nhs.uk/Id/chi-number`.

The Provider MAY support search by CHI Number.

> TODO: CHI Number system - do we define this as HL7 UK?

> TODO: Add request and example

##### Find a patient by H&C Number
The national identifier within Northern Ireland is the [H&C Number](https://www.datadictionary.nhs.uk/attributes/health_and_care_number.html)
which uses the identifier system `https://fhir.nhs.uk/Id/hc-number`.

The Provider MAY support search by H&C Number.

> TODO: H&C Number system - do we define this as HL7 UK?

> TODO: Add request and example

##### Find a patient by local identifier
Organisations holding patient data are likely to have their own identifier systems _e.g._ a hospital number from
a PAS system.
Organisations may use existing OIDs or allocate their own system but SHALL ensure that these do not 
clash with those used elsewhere.
Health and Care organisations in Wales should follow the NHS Wales Data Standards for [Welsh Patient Identifiers](https://simplifier.net/guide/FHIR-Standards-Wales-Implementation-Guide/Home/Design/Naming-Systems.page.md?version=current),

The Provider MAY support search by local identifier:
```
GET [base]/Patient?identifier=[Local system]|[PAS Number]
```
For example:
```
GET [base]/Patient?identifier=https://fhir.mytrust.nhs.uk/Id/pas-number|12345

Return all Patient resources with PAS Number 12345 issued by mytrust
```
##### Searches without systems
It is possible to search for patient by providing an identifier without specifying the identifier system.
```
GET [base]/Patient?identifier=[PAS Number]
```
For example:
```
GET [base]/Patient?identifier=12345

Return all Patient resources with identifier 12345, irrespective of the identifier system
```