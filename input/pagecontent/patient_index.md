### capabilities
A Patient Index Provider SHALL support the [capabilities](https://hl7.org/fhir/R4/http.html#capabilities) interaction so that
a Consumer can retrieve a [CapabilityStatement](https://hl7.org/fhir/R4/capabilitystatement.html) resource of type
`instance` that specifies which resource types and interactions are supported by the FHIR endpoint:
```
GET [base]/metadata
```
The CapabilityStatement SHALL be conformant with this implementation guide and SHOULD state that the FHIR endpoint instantiates the UKCore Access Patient Index [capabilities](./CapabilityStatement-UKCoreAccessPatientIndexProvider.html).
The Provider MAY provide further capabilities at this FHIR endpoint, in addition to those required by a Patient Index Provider.

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/metadata`
the Provider would respond with a CapabilityStatement resource. [[Example](CapabilityStatement-UKCoreAccessProvider-instance.html)]

### Patient search
A Patient Index Provider SHALL support the [search](https://hl7.org/fhir/R4/http.html#search) interaction on the 
[Patient](https://hl7.org/fhir/R4/patient.html) resource so that a Consumer can retrieve a set of Patient resources
matching the search criteria and conforming to the [UKCoreAccess PatientIndexPatient](StructureDefinition-UKCoreAccessPatientIndexPatient.html) profile.

A Patient Index Provider supports at least the following search parameters:

| Conformance | Parameter                           | Type                                                 | Description                                                                                                                            |
|-------------|-------------------------------------|------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| SHOULD      | [_id](patient_index.html#patient-_id) | [token](https://hl7.org/fhir/R4/search.html#token)   |                                                                                                                                        |
| SHALL       | [identifier](patient_index.html#patient-identifier) | [token](https://hl7.org/fhir/R4/search.html#token)   | A patient identifier                                                                                                            |
| SHOULD      | [family](patient_index.html#patient-family) | [string](https://hl7.org/fhir/R4/search.html#string) | A portion of the family name of the patient                                                                                            |
| SHOULD      | [given](patient_index.html#patient-given) | [string](https://hl7.org/fhir/R4/search.html#string) | A portion of the given name of the patient                                                                                             |
| SHALL       | [name](patient_index.html#patient-name) | [string](https://hl7.org/fhir/R4/search.html#string) | A server defined search that may match any of the string fields in the HumanName, including family, given, prefix, suffix, and/or text |
| SHALL       | [gender](patient_index.html#patient-gender) | [token](https://hl7.org/fhir/R4/search.html#token)   | Gender of the patient                                                                                                                  |
| SHOULD      | [birthdate](patient_index.html#patient-birthdate) | [date](https://hl7.org/fhir/R4/search.html#date)     | The patient's date of birth                                                                                                      |

A Patient Index Provider supports at least the following search parameter combinations:

| Conformance  | Parameters       | Example                                             |
|--------------|------------------|-----------------------------------------------------|
| SHOULD       | birthdate+family | `GET [base]/Patient?birthdate=[date]&family=[name]` |
| SHOULD       | birthdate+name   | `GET [base]/Patient?birthdate=[date]&name=[name]`   |
| SHOULD       | gender+family    | `GET [base]/Patient?gender=[gender]&family=[name]`  |
| SHOULD       | gender+name      | `GET [base]/Patient?gender=[gender]&name=[name]`    |

#### Patient _id
The Provider SHOULD support search by the logical identifier of the Patient resource:
```
GET [base]/Patient?_id=[id]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/Patient?_id=b88f0099-5213-4502-a49d-cc3887027bdd`
the Provider would respond with a Bundle containing Patient resources with id `b88f0099-5213-4502-a49d-cc3887027bdd`. [[Example](Bundle-Response-patientsearchbyid.html)]

#### Patient identifier
The Provider SHALL support search by identifier:
```
GET [base]/Patient?identifier=[system]|[value]
```

##### Find a patient by NHS Number
The national identifier within England, Wales and the Isle of Man is the [NHS Number](https://digital.nhs.uk/data-and-information/information-standards/information-standards-and-data-collections-including-extractions/publications-and-notifications/standards-and-collections/isb-0149-nhs-number)
which uses the identifier system `https://fhir.nhs.uk/Id/nhs-number`.

The Provider MAY support search by NHS Number:
```
GET [base]/Patient?identifier=https://fhir.nhs.uk/Id/nhs-number|[NHS Number]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/Patient?identifier=https://fhir.nhs.uk/Id/nhs-number|9912003888`
the Provider would respond with a Bundle containing Patient resources with NHS Number `9912003888`. [[Example](Bundle-Response-patientsearchbynhsnumber.html)]

##### Find a patient by CHI Number
The national identifier within Scotland is the [CHI Number](https://www.ndc.scot.nhs.uk/Dictionary-A-Z/Definitions/index.asp?ID=128)
which uses the identifier system `https://fhir.nhs.uk/Id/chi-number`.

The Provider MAY support search by CHI Number.

> TODO: CHI Number system
>
> TODO: Add request and example

##### Find a patient by H&C Number
The national identifier within Northern Ireland is the [H&C Number](https://www.datadictionary.nhs.uk/attributes/health_and_care_number.html)
which uses the identifier system `https://fhir.nhs.uk/Id/hc-number`.

The Provider MAY support search by H&C Number.

> TODO: H&C Number system
>
> TODO: Add request and example

##### Find a patient by local identifier
Organisations holding patient data are likely to have their own identifier systems _e.g._ a hospital number from
a PAS system.
Organisations may use existing OIDs or allocate their own system but SHALL ensure that these do not
clash with those used elsewhere.
Health and Care organisations in Wales should adopt the NHS Wales Data Standards for [Welsh Patient Identifiers](https://simplifier.net/guide/FHIR-Standards-Wales-Implementation-Guide/Home/Design/Naming-Systems.page.md?version=current).

The Provider MAY support search by local identifier:
```
GET [base]/Patient?identifier=[Local system]|[PAS Identifier]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/Patient?identifier=https://fhir.example-provider.nhs.uk/Id/pas-identifier|12345`
the Provider would respond with a Bundle containing Patient resources with hospital number `12345` issued by the `provider` organisation. [[Example](Bundle-Response-patientsearchbylocalsystem.html)]

##### Find a patient by identifier value
It is possible to search for patient by providing an identifier without specifying the identifier system.

The Provider MAY support search by identifier value:
```
GET [base]/Patient?identifier=[Identifier]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/Patient?identifier=12345`
the Provider would respond with a Bundle containing any Patient resources with identifier `12345` issued by any organisation. [[Example](Bundle-Response-patientsearchbyidentifiervalue.html)]

#### Patient family
The Provider SHOULD support search by patient family name:
```
GET [base]/Patient?family=[name]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/Patient?family=Smith`
the Provider would respond with a Bundle containing Patient resources with family name starting with `Smith`. [[Example](Bundle-Response-patientsearchbyfamily.html)]

#### Patient given
The Provider SHOULD support search by patient given name:
```
GET [base]/Patient?given=[name]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/Patient?given=Rich`
the Provider would respond with a Bundle containing Patient resources with given name starting with `Rich`. [[Example](Bundle-Response-patientsearchbygiven.html)]

#### Patient name
The Provider SHALL support search by patient name:
```
GET [base]/Patient?name=[name]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/Patient?name=Rich`
the Provider would respond with a Bundle containing Patient resources where part of the name starts with `Rich`. [[Example](Bundle-Response-patientsearchbyname.html)]

#### Patient gender
A Provider SHALL support search by patient gender:
```
GET [base]/Patient?gender=[code]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/Patient?gender=female`
the Provider would respond with a Bundle containing Patient resources with gender `female`. [[Example](Bundle-Response-patientsearchbygender.html)]

#### Patient birthdate
The Provider SHOULD support search by patient birthdate:
```
GET [base]/Patient?birthdate=[date]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/Patient?birthdate=1970-09-11`
the Provider would respond with a Bundle containing Patient resources with birthdate `1970-09-11`. [[Example](Bundle-Response-patientsearchbybirthdate.html)]

Where a Provider supports search by patient birthdate, the Provider SHOULD support:
- partial dates *e.g.* `birthdate=1970-09`
- the `eq`, `ge`, `le` operators *e.g.* `birthdate=ge1970-09-01`
- multiple date parameters *e.g.* `birthdate=ge1970-09-01&birthdate=le1970-10-01`

 
