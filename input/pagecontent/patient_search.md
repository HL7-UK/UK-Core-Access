### Patient search
The Provider SHALL support the [search](https://hl7.org/fhir/R4/http.html#search) interaction on the 
[Patient](https://hl7.org/fhir/R4/patient.html) resource so that a Consumer can retrieve a set of Patient resources
matching the search criteria and conforming to the [UKCore Patient](https://simplifier.net/guide/uk-core-implementation-guide/Home/ProfilesandExtensions/ProfileUKCore-Patient?version=1.0.0) profile.

The Provider is required to support search parameters as follows:

| Conformance  | Parameter                                              | Type                                                 | Description                                                                                                                                   |
|--------------|--------------------------------------------------------|------------------------------------------------------|:----------------------------------------------------------------------------------------------------------------------------------------------|
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


#### _id parameter
TODO: documentation

#### birthdate parameter
TODO: documentation

#### family parameter
TODO: documentation

#### gender parameter
TODO: documentation

#### given parameter
TODO: documentation

#### identifier parameter
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
TODO: documentation


#### Related standards
The Patient search capability in the UKCore Access implementation guide is closely related to patient search
defined in international interoperability standards including:
- [IHE Patient Demographics Query for Mobile](https://profiles.ihe.net/ITI/PDQm/index.html)
- [HL7 International Patient Access](https://build.fhir.org/ig/HL7/fhir-ipa/index.html)
- [NHS Personal Demographics Service - FHIR API](https://digital.nhs.uk/developer/api-catalogue/personal-demographics-service-fhir)

The Providers are required to support search parameters as follows: 

| Parameter             | UKCore Access | PDQm  | IPA    | PDS FHIR API       |
|-----------------------|---------------|-------|--------|--------------------|
| _id                   | SHOULD        | SHALL | SHOULD | SHALL NOT          |
| active                | MAY           | SHALL | MAY    | SHALL NOT          |
| address               | MAY           | SHALL | MAY    | SHALL NOT          |
| address-city          | MAY           | SHALL | MAY    | SHALL NOT          |
| address-country       | MAY           | SHALL | MAY    | SHALL NOT          |
| address-postalcode    | MAY           | SHALL | MAY    | ? address-postcode |
| address-postcode      | MAY           | MAY   | MAY    | SHALL              |
| address-state         | MAY           | SHALL | MAY    | SHALL NOT          |
| birthdate             | SHOULD        | SHALL | SHOULD | SHALL              |
| death-date            | MAY           | MAY   | MAY    | SHALL              |
| family                | SHOULD        | SHALL | SHOULD | SHALL              |
| gender                | SHOULD        | SHALL | SHOULD | SHALL              |
| general-practitioner  | MAY           | MAY   | MAY    | SHALL              |
| given                 | SHOULD        | SHALL | SHOULD | SHALL              |
| identifier            | SHALL         | SHALL | SHOULD | SHALL NOT          |
| mothersMaidenName     | MAY           | SHALL | MAY    | SHALL NOT          |
| name                  | SHOULD        | SHALL | SHOULD | SHALL              |
| telecom               | MAY           | SHALL | MAY    | SHALL NOT          |
