### capabilities
A Clinical Data Provider SHALL support the [capabilities](https://hl7.org/fhir/R4/http.html#capabilities) interaction so that
a Consumer can retrieve a [CapabilityStatement](https://hl7.org/fhir/R4/capabilitystatement.html) resource of type
`instance` that specifies which resource types and interactions are supported by the FHIR endpoint:
```
GET [base]/metadata
```
The CapabilityStatement SHALL be conformant with this implementation guide and SHOULD state that the FHIR endpoint instantiates the UK Core Access Clinical Data [capabilities](./CapabilityStatement-UKCoreAccessClinicalDataProvider.html).
The Provider MAY provide further capabilities at this FHIR endpoint, in addition to those required by a Clinical Data Provider.

### Patient search
A Clinical Data Provider SHALL support the [search](https://hl7.org/fhir/R4/http.html#search) interaction on the
[Patient](https://hl7.org/fhir/R4/patient.html) resource so that a Consumer can retrieve a set of Patient resources
matching the search criteria and conforming to the [UK Core Patient](https://simplifier.net/guide/uk-core-implementation-guide/Home/ProfilesandExtensions/ProfileUKCore-Patient?version=1.0.0) profile.

A Clinical Data Provider supports at least the following search parameters:

| Conformance | Parameter                                   | Type                                                 | Description            |
|-------------|---------------------------------------------|------------------------------------------------------|------------------------|
| SHOULD      | [_id](clinical_data.html#patient-_id)       | [token](https://hl7.org/fhir/R4/search.html#token)   |                        |
| SHALL       | [identifier](clinical_data.html#patient-identifier) | [token](https://hl7.org/fhir/R4/search.html#token)   | A patient identifier   |

#### Patient _id
See [Patient _id](patient_index.html#patient-_id) from Patient Index for details.

#### Patient identifier
See [Patient identifier](patient_index.html#patient-identifier) from Patient Index for details.

### AllergyIntolerance search
Where the underlying system can reliably provide the information, a Clinical Data Provider SHOULD support the
[search](https://hl7.org/fhir/R4/http.html#search) interaction on the 
[AllergyIntolerance](https://hl7.org/fhir/R4/allergyintolerance.html) resource so that a Consumer can retrieve a 
set of AllergyIntolerance resources matching the search criteria and conforming to the 
[UK Core AllergyIntolerance](https://simplifier.net/guide/uk-core-implementation-guide/Home/ProfilesandExtensions/ProfileUKCore-AllergyIntolerance?version=1.0.0) profile.

A Clinical Data Provider supports at least the following search parameters:

| Conformance | Parameter                                                                | Type                                                       | Description                                              |
|-------------|--------------------------------------------------------------------------|------------------------------------------------------------|----------------------------------------------------------|
| SHOULD      | [_id](clinical_data.html#allergyintolerance-_id)                         | [token](https://hl7.org/fhir/R4/search.html#token)         |                                                          |
| SHALL       | [patient](clinical_data.html#allergyintolerance-patient)                 | [reference](https://hl7.org/fhir/R4/search.html#reference) | Who the sensitivity is for                               |
| SHALL       | [clinical-status](clinical_data.html#allergyintolerance-clinical-status) | [token](https://hl7.org/fhir/R4/search.html#token)         | active, inactive or resolved                             |
| SHOULD      | [date](clinical_data.html#allergyintolerance-date)                       | [date](https://hl7.org/fhir/R4/search.html#date)           | Date first version of the resource instance was recorded |
| SHOULD      | [last-date](clinical_data.html#allergyintolerance-last-date)             | [date](https://hl7.org/fhir/R4/search.html#date)           | Date(/time) of last known occurrence of a reaction       |

A Clinical Data Provider supports at least the following search parameter combinations:

| Conformance  | Parameters              | Example                                                               |
|--------------|-------------------------|-----------------------------------------------------------------------|
| SHOULD       | patient+date            | `GET [base]/AllergyIntolerance?patient=[id]&date=[date]`              |
| SHOULD       | patient+last-date       | `GET [base]/AllergyIntolerance?patient=[id]&last-date=[date]`         |
| SHOULD       | patient+clinical-status | `GET [base]/AllergyIntolerance?patient=[id]&clinical-status=[status]` |

#### AllergyIntolerance _id
The Provider SHOULD support search by the logical identifier of the AllergyIntolerance resource:
```
GET [base]/AllergyIntolerance?_id=[id]
```

#### AllergyIntolerance patient
The Provider SHALL support search by patient:
```
GET [base]/AllergyIntolerance?patient=[id]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/AllergyIntolerance?patient=b88f0099-5213-4502-a49d-cc3887027bdd`
the Provider would respond with a Bundle containing AllergyIntolerance resources that reference patient `b88f0099-5213-4502-a49d-cc3887027bdd`.

#### AllergyIntolerance clinical-status
The Provider SHALL support search by clinical status:
```
GET [base]/AllergyIntolerance?clinical-status=[status]&patient=[id]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/AllergyIntolerance?clinical-status=active&patient=b88f0099-5213-4502-a49d-cc3887027bdd`
the Provider would respond with a Bundle containing AllergyIntolerance resources with clinicalStatus `active` that reference patient `b88f0099-5213-4502-a49d-cc3887027bdd` .

#### AllergyIntolerance date
The Provider SHOULD support search by recorded date:
```
GET [base]/AllergyIntolerance?date=[date]&patient=[id]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/AllergyIntolerance?date=ge2018-01-01&patient=b88f0099-5213-4502-a49d-cc3887027bdd`
the Provider would respond with a Bundle containing AllergyIntolerance resources recorded on or after `2018-01-01` that reference patient `b88f0099-5213-4502-a49d-cc3887027bdd`.

Where a Provider supports search by date, the Provider SHOULD support partial dates, the `eq`, `ge`, `le` operators and 
multiple date parameters. See Patient Index [birthdate](patient_index.html#patient-birthdate) for details.

#### AllergyIntolerance last-date
The Provider SHOULD support search by last occurrence:
```
GET [base]/AllergyIntolerance?last-date=[date]&patient=[id]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/AllergyIntolerance?last-date=ge2018-01-01&patient=b88f0099-5213-4502-a49d-cc3887027bdd`
the Provider would respond with a Bundle containing AllergyIntolerance resources last occurring on or after `2018-01-01` that reference patient `b88f0099-5213-4502-a49d-cc3887027bdd`.

Where a Provider supports search by date, the Provider SHOULD support partial dates, the `eq`, `ge`, `le` operators and
multiple date parameters. See Patient Index [birthdate](patient_index.html#patient-birthdate) for details.

### Immunization search
Where the underlying system can reliably provide the information, a Clinical Data Provider SHOULD support the
[search](https://hl7.org/fhir/R4/http.html#search) interaction on the
[Immunization](https://hl7.org/fhir/R4/immunization.html) resource so that a Consumer can retrieve a
set of Immunization resources matching the search criteria and conforming to the
[UK Core Immunization](https://simplifier.net/guide/uk-core-implementation-guide/Home/ProfilesandExtensions/ProfileUKCore-Immunization?version=1.0.0) profile.

A Clinical Data Provider supports at least the following search parameters:

| Conformance | Parameter                                                         | Type                                                       | Description                              |
|-------------|-------------------------------------------------------------------|------------------------------------------------------------|------------------------------------------|
| SHOULD      | [_id](clinical_data.html#immunization-_id)                        | [token](https://hl7.org/fhir/R4/search.html#token)         |                                          |
| SHALL       | [patient](clinical_data.html#immunization-patient)                | [reference](https://hl7.org/fhir/R4/search.html#reference) | The patient for the vaccination record   |
| SHALL       | [status](clinical_data.html#immunization-status)                  | [token](https://hl7.org/fhir/R4/search.html#token)         | completed, entered-in-error, or not-done |
| SHOULD      | [date](clinical_data.html#immunization-date)                      | [date](https://hl7.org/fhir/R4/search.html#date)           | Vaccination (non)-Administration Date    |

A Clinical Data Provider supports at least the following search parameter combinations:

| Conformance  | Parameters       | Example                                                                 |
|--------------|------------------|-------------------------------------------------------------------------|
| SHOULD       | patient+date     | `GET [base]/Immunization?patient=[id]&date=[date]`                      |
| SHOULD       | patient+status   | `GET [base]/Immunization?patient=[id]&status=[status]`                  |

#### Immunization _id
The Provider SHOULD support search by the logical identifier of the Immunization resource:
```
GET [base]/Immunization?_id=[id]
```

#### Immunization patient
The Provider SHALL support search by patient:
```
GET [base]/Immunization?patient=[id]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/Immunization?patient=b88f0099-5213-4502-a49d-cc3887027bdd`
the Provider would respond with a Bundle containing Immunization resources that reference patient `b88f0099-5213-4502-a49d-cc3887027bdd`.

#### Immunization status
The Provider SHALL support search by status:
```
GET [base]/Immunization?status=[status]&patient=[id]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/Immunization?status=completed&patient=b88f0099-5213-4502-a49d-cc3887027bdd`
the Provider would respond with a Bundle containing Immunization resources that are completed and reference patient `b88f0099-5213-4502-a49d-cc3887027bdd`.

#### Immunization date
The Provider SHOULD support search by administration date:
```
GET [base]/Immunization?date=[date]&patient=[id]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/Immunization?date=ge2018-01-01&patient=b88f0099-5213-4502-a49d-cc3887027bdd`
the Provider would respond with a Bundle containing Immunization resources administered on or after `2018-01-01` that reference patient `b88f0099-5213-4502-a49d-cc3887027bdd`.

Where a Provider supports search by date, the Provider SHOULD support partial dates, the `eq`, `ge`, `le` operators and
multiple date parameters. See Patient Index [birthdate](patient_index.html#patient-birthdate) for details.

### MedicationAdministration search
Where the underlying system can reliably provide the information, a Clinical Data Provider SHOULD support the
[search](https://hl7.org/fhir/R4/http.html#search) interaction on the
[MedicationAdministration](https://hl7.org/fhir/R4/medicationadministration.html) resource so that a Consumer can retrieve a
set of MedicationAdministration resources matching the search criteria and conforming to the
[UK Core MedicationAdministration](https://simplifier.net/guide/uk-core-implementation-guide/Home/ProfilesandExtensions/ProfileUKCore-MedicationAdministration?version=1.0.0) profile.

A Clinical Data Provider supports at least the following search parameters:

| Conformance | Parameter                                                                    | Type                                                       | Description                                                                                  |
|-------------|------------------------------------------------------------------------------|------------------------------------------------------------|----------------------------------------------------------------------------------------------|
| SHOULD      | [_id](clinical_data.html#medicationadministration-_id)                       | [token](https://hl7.org/fhir/R4/search.html#token)         |                                                                                              |
| SHALL       | [patient](clinical_data.html#medicationadministration-patient)               | [reference](https://hl7.org/fhir/R4/search.html#reference) | The identity of a patient to list administrations for                                        |
| SHALL       | [status](clinical_data.html#medicationadministration-status)                 | [token](https://hl7.org/fhir/R4/search.html#token)         | MedicationAdministration event status (for example one of active/paused/completed/nullified) |
| SHALL       | [effective-time](clinical_data.html#medicationadministration-effective-time) | [date](https://hl7.org/fhir/R4/search.html#date)           | Date administration happened (or did not happen)                                             |

A Clinical Data Provider supports at least the following search parameter combinations:

| Conformance  | Parameters             | Example                                                                  |
|--------------|------------------------|--------------------------------------------------------------------------|
| SHOULD       | patient+status         | `GET [base]/MedicationAdministration?patient=[id]&status=[status]`       |
| SHOULD       | patient+effective-time | `GET [base]/MedicationAdministration?patient=[id]&effective-time=[date]` |

#### MedicationAdministration _id
The Provider SHOULD support search by the logical identifier of the MedicationAdministration resource:
```
GET [base]/MedicationAdministration?_id=[id]
```

#### MedicationAdministration patient
The Provider SHALL support search by patient:
```
GET [base]/MedicationAdministration?patient=[id]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/MedicationAdministration?patient=b88f0099-5213-4502-a49d-cc3887027bdd`
the Provider would respond with a Bundle containing MedicationAdministration resources that reference patient `b88f0099-5213-4502-a49d-cc3887027bdd`.

#### MedicationAdministration status
The Provider SHALL support search by status:
```
GET [base]/MedicationAdministration?status=[status]&patient=[id]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/MedicationAdministration?status=completed&patient=b88f0099-5213-4502-a49d-cc3887027bdd`
the Provider would respond with a Bundle containing MedicationAdministration resources that are completed and reference patient `b88f0099-5213-4502-a49d-cc3887027bdd`.

#### MedicationAdministration effective-time
The Provider SHALL support search by effective date and time:
```
GET [base]/MedicationAdministration?effective-time=[date]&patient=[id]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/MedicationAdministration?effective-time=ge2018-01-01&patient=b88f0099-5213-4502-a49d-cc3887027bdd`
the Provider would respond with a Bundle containing MedicationAdministration resources effective on or after `2018-01-01` that reference patient `b88f0099-5213-4502-a49d-cc3887027bdd`.

Where a Provider supports search by date, the Provider SHOULD support partial dates, the `eq`, `ge`, `le` operators and
multiple date parameters. See Patient Index [birthdate](patient_index.html#patient-birthdate) for details.

### MedicationDispense search
Where the underlying system can reliably provide the information, a Clinical Data Provider SHOULD support the
[search](https://hl7.org/fhir/R4/http.html#search) interaction on the
[MedicationDispense](https://hl7.org/fhir/R4/medicationdispense.html) resource so that a Consumer can retrieve a
set of MedicationDispense resources matching the search criteria and conforming to the
[UK Core MedicationDispense](https://simplifier.net/guide/uk-core-implementation-guide/Home/ProfilesandExtensions/ProfileUKCore-MedicationDispense?version=1.0.0) profile.

A Clinical Data Provider supports at least the following search parameters:

| Conformance | Parameter                                                          | Type                                                       | Description                                        |
|-------------|--------------------------------------------------------------------|------------------------------------------------------------|----------------------------------------------------|
| SHOULD      | [_id](clinical_data.html#medicationdispense-_id)                   | [token](https://hl7.org/fhir/R4/search.html#token)         |                                                    |
| SHALL       | [patient](clinical_data.html#medicationdispense-patient)           | [reference](https://hl7.org/fhir/R4/search.html#reference) | The identity of a patient to list dispenses for    |
| SHALL       | [status](clinical_data.html#medicationdispense-status)             | [token](https://hl7.org/fhir/R4/search.html#token)         | Returns dispenses with a specified dispense status |
| SHOULD      | [whenprepared](clinical_data.html#medicationdispense-whenprepared) | [date](https://hl7.org/fhir/R4/search.html#date)           | 	Returns dispenses prepared on this date           |

A Clinical Data Provider supports at least the following search parameter combinations:

| Conformance  | Parameters            | Example                                                              |
|--------------|-----------------------|----------------------------------------------------------------------|
| SHOULD       | patient+status        | `GET [base]/MedicationDispense?patient=[id]&status=[status]`         |
| SHOULD       | patient+whenprepared  | `GET [base]/MedicationDispense?patient=[id]&whenprepared=[date]`     |

#### MedicationDispense _id
The Provider SHOULD support search by the logical identifier of the MedicationDispense resource:
```
GET [base]/MedicationDispense?_id=[id]
```

#### MedicationDispense patient
The Provider SHALL support search by patient:
```
GET [base]/MedicationDispense?patient=[id]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/MedicationDispense?patient=b88f0099-5213-4502-a49d-cc3887027bdd`
the Provider would respond with a Bundle containing MedicationDispense resources that reference patient `b88f0099-5213-4502-a49d-cc3887027bdd`.

#### MedicationDispense status
The Provider SHALL support search by status:
```
GET [base]/MedicationDispense?status=[status]&patient=[id]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/MedicationDispense?status=completed&patient=b88f0099-5213-4502-a49d-cc3887027bdd`
the Provider would respond with a Bundle containing MedicationDispense resources that are completed and reference patient `b88f0099-5213-4502-a49d-cc3887027bdd`.

#### MedicationDispense whenprepared
The Provider SHOULD support search by date of preparation:
```
GET [base]/MedicationDispense?whenprepared=[date]&patient=[id]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/MedicationDispense?whenprepared=ge2022-01-01&patient=b88f0099-5213-4502-a49d-cc3887027bdd`
the Provider would respond with a Bundle containing MedicationDispense resources prepared on or after `2022-01-01` that reference patient `b88f0099-5213-4502-a49d-cc3887027bdd`.

Where a Provider supports search by date, the Provider SHOULD support partial dates, the `eq`, `ge`, `le` operators and
multiple date parameters. See Patient Index [birthdate](patient_index.html#patient-birthdate) for details.

### MedicationRequest search
Where the underlying system can reliably provide the information, a Clinical Data Provider SHOULD support the
[search](https://hl7.org/fhir/R4/http.html#search) interaction on the
[MedicationRequest](https://hl7.org/fhir/R4/medicationadministration.html) resource so that a Consumer can retrieve a
set of MedicationRequest resources matching the search criteria and conforming to the
[UK Core MedicationRequest](https://simplifier.net/guide/uk-core-implementation-guide/Home/ProfilesandExtensions/ProfileUKCore-MedicationRequest?version=1.0.0) profile.

A Clinical Data Provider supports at least the following search parameters:

| Conformance | Parameter                                                     | Type                                                       | Description                                   |
|-------------|---------------------------------------------------------------|------------------------------------------------------------|-----------------------------------------------|
| SHOULD      | [_id](clinical_data.html#medicationrequest-_id)               | [token](https://hl7.org/fhir/R4/search.html#token)         |                                               |
| SHALL       | [patient](clinical_data.html#medicationrequest-patient)       | [reference](https://hl7.org/fhir/R4/search.html#reference) | Returns prescriptions for a specific patient  |
| SHALL       | [status](clinical_data.html#medicationrequest-status)         | [token](https://hl7.org/fhir/R4/search.html#token)         | Status of the prescription                    |
| SHOULD      | [authoredon](clinical_data.html#medicationrequest-authoredon) | [date](https://hl7.org/fhir/R4/search.html#date)           | Return prescriptions written on this date     |

A Clinical Data Provider supports at least the following search parameter combinations:

| Conformance  | Parameters         | Example                                                       |
|--------------|--------------------|---------------------------------------------------------------|
| SHOULD       | patient+status     | `GET [base]/MedicationRequest?patient=[id]&status=[status]`   |
| SHOULD       | patient+authoredon | `GET [base]/MedicationRequest?patient=[id]&authoredon=[date]` |

#### MedicationRequest _id
The Provider SHOULD support search by the logical identifier of the MedicationRequest resource:
```
GET [base]/MedicationRequest?_id=[id]
```

#### MedicationRequest patient
The Provider SHALL support search by patient:
```
GET [base]/MedicationRequest?patient=[id]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/MedicationRequest?patient=b88f0099-5213-4502-a49d-cc3887027bdd`
the Provider would respond with a Bundle containing MedicationRequest resources that reference patient `b88f0099-5213-4502-a49d-cc3887027bdd`.

#### MedicationRequest status
The Provider SHALL support search by status:
```
GET [base]/MedicationRequest?status=[status]&patient=[id]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/MedicationRequest?status=completed&patient=b88f0099-5213-4502-a49d-cc3887027bdd`
the Provider would respond with a Bundle containing MedicationRequest resources that are completed and reference patient `b88f0099-5213-4502-a49d-cc3887027bdd`.

#### MedicationRequest authoredon
The Provider SHOULD support search by date on which the request was authored:
```
GET [base]/MedicationRequest?authoredon=[date]&patient=[id]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/MedicationRequest?authoredon=ge2022-01-01&patient=b88f0099-5213-4502-a49d-cc3887027bdd`
the Provider would respond with a Bundle containing MedicationRequest resources authored on or after `2022-01-01` that reference patient `b88f0099-5213-4502-a49d-cc3887027bdd`.

Where a Provider supports search by date, the Provider SHOULD support partial dates, the `eq`, `ge`, `le` operators and
multiple date parameters. See Patient Index [birthdate](patient_index.html#patient-birthdate) for details.

### MedicationStatement search
Where the underlying system can reliably provide the information, a Clinical Data Provider SHOULD support the
[search](https://hl7.org/fhir/R4/http.html#search) interaction on the
[MedicationStatement](https://hl7.org/fhir/R4/medicationstatement.html) resource so that a Consumer can retrieve a
set of MedicationStatement resources matching the search criteria and conforming to the
[UK Core MedicationStatement](https://simplifier.net/guide/uk-core-implementation-guide/Home/ProfilesandExtensions/ProfileUKCore-MedicationStatement?version=1.0.0) profile.

A Clinical Data Provider supports at least the following search parameters:

| Conformance | Parameter                                                     | Type                                                       | Description                                                 |
|-------------|---------------------------------------------------------------|------------------------------------------------------------|-------------------------------------------------------------|
| SHOULD      | [_id](clinical_data.html#medicationstatement-_id)             | [token](https://hl7.org/fhir/R4/search.html#token)         |                                                             |
| SHALL       | [patient](clinical_data.html#medicationstatement-patient)     | [reference](https://hl7.org/fhir/R4/search.html#reference) | Returns statements for a specific patient.                  |
| SHALL       | [status](clinical_data.html#medicationstatement-status)       | [token](https://hl7.org/fhir/R4/search.html#token)         | Return statements that match the given status               |
| SHOULD      | [effective](clinical_data.html#medicationstatement-effective) | [date](https://hl7.org/fhir/R4/search.html#date)           | Date when patient was taking (or not taking) the medication |

A Clinical Data Provider supports at least the following search parameter combinations:

| Conformance  | Parameters        | Example                                                        |
|--------------|-------------------|----------------------------------------------------------------|
| SHOULD       | patient+status    | `GET [base]/MedicationStatement?patient=[id]&status=[status]`  |
| SHOULD       | patient+effective | `GET [base]/MedicationStatement?patient=[id]&effective=[date]` |

#### MedicationStatement _id
The Provider SHOULD support search by the logical identifier of the MedicationStatement resource:
```
GET [base]/MedicationStatement?_id=[id]
```

#### MedicationStatement patient
The Provider SHALL support search by patient:
```
GET [base]/MedicationStatement?patient=[id]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/MedicationStatement?patient=b88f0099-5213-4502-a49d-cc3887027bdd`
the Provider would respond with a Bundle containing MedicationStatement resources that reference patient `b88f0099-5213-4502-a49d-cc3887027bdd`.

#### MedicationStatement status
The Provider SHALL support search by status:
```
GET [base]/MedicationStatement?status=[status]&patient=[id]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/MedicationStatement?status=completed&patient=b88f0099-5213-4502-a49d-cc3887027bdd`
the Provider would respond with a Bundle containing MedicationStatement resources that are completed and reference patient `b88f0099-5213-4502-a49d-cc3887027bdd`.

#### MedicationStatement effective
The Provider SHOULD support search by effective date:
```
GET [base]/MedicationStatement?effective=[date]&patient=[id]
```

For example, when a Consumer sends the request `GET https://fhir.example-provider.nhs.uk/MedicationStatement?effective=ge2018-01-01&patient=b88f0099-5213-4502-a49d-cc3887027bdd`
the Provider would respond with a Bundle containing MedicationStatement resources effective on or after `2018-01-01` that reference patient `b88f0099-5213-4502-a49d-cc3887027bdd`.

Where a Provider supports search by date, the Provider SHOULD support partial dates, the `eq`, `ge`, `le` operators and
multiple date parameters. See Patient Index [birthdate](patient_index.html#patient-birthdate) for details.

