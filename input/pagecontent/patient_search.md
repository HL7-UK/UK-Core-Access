### Patient search
The Provider SHALL support the [search](https://hl7.org/fhir/R4/http.html#search) interaction on the 
[Patient](https://hl7.org/fhir/R4/patient.html) resource so that a Consumer can retrieve a set of Patient resources
matching the search criteria and conforming to the [UKCore Patient](https://simplifier.net/guide/uk-core-implementation-guide/Home/ProfilesandExtensions/ProfileUKCore-Patient?version=1.0.0) profile.

The Provider SHALL be capable of processing the following search parameters:

| Parameter                                      | Type      | Description |
|------------------------------------------------|-----------|-------------|
| [identifier](./patient_search.html#identifier) | [token](https://hl7.org/fhir/R4/search.html#token) | A patient identifier |

#### identifier parameter
##### Find a patient by NHS Number
The national identifier within England, Wales and the Isle of Man is the [NHS Number](https://digital.nhs.uk/data-and-information/information-standards/information-standards-and-data-collections-including-extractions/publications-and-notifications/standards-and-collections/isb-0149-nhs-number)
which uses the identifier system `https://fhir.nhs.uk/Id/nhs-number`.

The Provider MAY support search by NHS Number:
```
GET [base]/Patient?identifier=https://fhir.nhs.uk/Id/nhs-number|[NHS Number]
```

For example, when a Consumer sends the request `GET https://fhir.provider.nhs.uk/Patient?identifier=https://fhir.nhs.uk/Id/nhs-number|9912003888`
the Provider would respond with a Bundle containing Patient resources with NHS Number `9912003888`. [[Example](./Bundle-Example-UKCoreAccess-Bundle-patientsearchbynhsnumber.html)]

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

For example, when a Consumer sends the request `GET https://fhir.provider.nhs.uk/Patient?identifier=https://fhir.provider.nhs.uk/Id/pas-identifier|12345`
the Provider would respond with a Bundle containing Patient resources with hospital number `12345` issued by the `provider` organisation. [[Example](./Bundle-Example-UKCoreAccess-Bundle-patientsearchbylocalsystem.html)]

##### Find a patient by identifier value
It is possible to search for patient by providing an identifier without specifying the identifier system.

The Provider MAY support search by identifier value:
```
GET [base]/Patient?identifier=[Identifier]
```

For example, when a Consumer sends the request `GET https://fhir.provider.nhs.uk/Patient?identifier=12345`
the Provider would respond with a Bundle containing any Patient resources with identifier `12345` issued by any organisation. [[Example](./Bundle-Example-UKCoreAccess-Bundle-patientsearchbyidentifiervalue.html)]

#### Related standards
> TODO: Document relation to IHE PDQm (subset of PDQm)
