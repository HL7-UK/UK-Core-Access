### Patient search
The Provider SHALL support the [search](https://hl7.org/fhir/R4/http.html#search) interaction on the 
[Patient](https://hl7.org/fhir/R4/patient.html) resource so that a Consumer can retrieve a set of Patient resources
matching the search criteria and conforming to the [UKCore Patient](https://simplifier.net/guide/uk-core-implementation-guide/Home/ProfilesandExtensions/ProfileUKCore-Patient?version=1.0.0) profile.

The Provider is required to support search parameters as follows:

| Conformance  | Parameter                                              | Type                                                 | Description                                                                                                                                   |
|--------------|--------------------------------------------------------|------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| SHALL        | [_id](patient_search.html#_id-parameter)               | [token](https://hl7.org/fhir/R4/search.html#token)   |                                                                                                                                               |
| SHOULD       | [birthdate](patient_search.html#identifier-parameter)  | [date](https://hl7.org/fhir/R4/search.html#date)     | The patient's date of birth                                                                                                                   |
| SHOULD       | [family](patient_search.html#family-parameter)         | [string](https://hl7.org/fhir/R4/search.html#string) | A portion of the family name of the patient                                                                                                   |
| SHOULD       | [gender](patient_search.html#gender-parameter)         | [token](https://hl7.org/fhir/R4/search.html#token)   | Gender of the patient                                                                                                                         |
| SHOULD       | [given](patient_search.html#given-parameter)           | [string](https://hl7.org/fhir/R4/search.html#string) | A portion of the given name of the patient                                                                                                    |
| SHALL        | [identifier](patient_search.html#identifier-parameter) | [token](https://hl7.org/fhir/R4/search.html#token)   | A patient identifier                                                                                                                          |
| SHOULD       | [name](patient_search.html#name-parameter)             | [string](https://hl7.org/fhir/R4/search.html#string) | A server defined search that may match any of the string fields in the HumanName, including family, give, prefix, suffix, suffix, and/or text |

The Provider is required to support search parameter combinations as follows:

| Conformance  | Parameter                                              |
|--------------|--------------------------------------------------------|
| SHOULD       | birthdate+family                                       |
| SHOULD       | birthdate+name                                         |
| SHOULD       | gender+family                                          |
| SHOULD       | gender+name                                            |

The Consumer SHALL handle search results where the Provider returns results as a series of [pages](https://hl7.org/fhir/R4/search.html#count).

#### _id parameter
The Provider SHALL support search by the logical identifier of the Patient resource:
```
GET [base]/Patient?_id=[id]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/Patient?_id=b88f0099-5213-4502-a49d-cc3887027bdd`
the Provider would respond with a Bundle containing Patient resources with id `b88f0099-5213-4502-a49d-cc3887027bdd`. [[Example](Bundle-Response-patientsearchbyid.html)]

#### birthdate parameter
The Provider SHOULD support search by patient birthdate:
```
GET [base]/Patient?birthdate=[date]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/Patient?birthdate=1970-09-11`
the Provider would respond with a Bundle containing Patient resources with birthdate `1970-09-11`. [[Example](Bundle-Response-patientsearchbybirthdate.html)]

The Provider SHOULD support:
- partial dates *e.g.* `birthdate=1970-09`
- the `eq`, `ge`, `le` operators *e.g.* `birthdate=ge1970-09-01`
- multiple date parameters *e.g.* `birthdate=ge1970-09-01&le1970-10-01`

#### family parameter
The Provider SHOULD support search by patient family name:
```
GET [base]/Patient?family=[name]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/Patient?family=Smith`
the Provider would respond with a Bundle containing Patient resources with family name starting with `Smith`. [[Example](Bundle-Response-patientsearchbyfamily.html)]


#### gender parameter
The Provider SHOULD support search by patient gender:
```
GET [base]/Patient?gender=[code]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/Patient?gender=female`
the Provider would respond with a Bundle containing Patient resources with gender `female`. [[Example](Bundle-Response-patientsearchbygender.html)]

#### given parameter
The Provider SHOULD support search by patient given name:
```
GET [base]/Patient?given=[name]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/Patient?given=Rich`
the Provider would respond with a Bundle containing Patient resources with given name starting with `Rich`. [[Example](Bundle-Response-patientsearchbygiven.html)]

#### identifier parameter
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

#### name parameter
The Provider SHOULD support search by patient name:
```
GET [base]/Patient?name=[name]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/Patient?make=`
the Provider would respond with a Bundle containing Patient resources where part of the name starts with `Rich`. [[Example](Bundle-Response-patientsearchbyname.html)]

#### Related standards
The Patient search capability in the UKCore Access implementation guide is closely related to patient search
defined in international interoperability standards including:
- [IHE Patient Demographics Query for Mobile](https://profiles.ihe.net/ITI/PDQm/index.html)
- [HL7 International Patient Access](https://build.fhir.org/ig/HL7/fhir-ipa/index.html)

Servers are required to support Patient search parameters as follows: 

| Parameter             | UKCore Access | PDQm  | IPA    | 
|-----------------------|---------------|-------|--------|
| _id                   | SHOULD        | SHALL | SHOULD | 
| active                | MAY           | SHALL | MAY    | 
| address               | MAY           | SHALL | MAY    | 
| address-city          | MAY           | SHALL | MAY    | 
| address-country       | MAY           | SHALL | MAY    | 
| address-postalcode    | MAY           | SHALL | MAY    | 
| address-state         | MAY           | SHALL | MAY    | 
| birthdate             | SHOULD        | SHALL | SHOULD | 
| death-date            | MAY           | MAY   | MAY    | 
| family                | SHOULD        | SHALL | SHOULD | 
| gender                | SHOULD        | SHALL | SHOULD | 
| general-practitioner  | MAY           | MAY   | MAY    | 
| given                 | SHOULD        | SHALL | SHOULD | 
| identifier            | SHALL         | SHALL | SHOULD | 
| mothersMaidenName     | MAY           | SHALL | MAY    | 
| name                  | SHOULD        | SHALL | SHOULD | 
| telecom               | MAY           | SHALL | MAY    | 
