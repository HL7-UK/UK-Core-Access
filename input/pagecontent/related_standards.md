### Patient Index Provider
The Patient Index Provider capabilities in the UKCore Access implementation guide are closely related to patient search
defined in international interoperability standards including:
- [HL7 International Patient Access](https://build.fhir.org/ig/HL7/fhir-ipa/index.html)
- [IHE Patient Demographics Query for Mobile](https://profiles.ihe.net/ITI/PDQm/index.html)

#### Patient search
Servers are required to support Patient search parameters as follows:

| Parameter  | Patient Index Provider | IPA    | PDQm  |
|------------|------------------------|--------|-------|
| _id        | SHOULD                 | SHALL  | SHALL | 
| identifier | SHALL                  | SHALL  | SHALL | 
| family     | SHOULD                 | SHOULD | SHALL | 
| given      | SHOULD                 | SHOULD | SHALL | 
| name       | SHALL                  | SHOULD | SHALL |
| gender     | SHALL                  | SHOULD | SHALL | 
| birthdate  | SHOULD                 | SHOULD | SHALL |

### Clinical Data Provider
The Clinical Data Provider capabilities in the UKCore Access implementation guide are closely related to clinical data retrieval
defined in international interoperability standards including:
- [HL7 International Patient Access](https://build.fhir.org/ig/HL7/fhir-ipa/index.html)
- [IHE Query for Existing Data for Mobile](https://wiki.ihe.net/index.php/Query_for_Existing_Data_for_Mobile_(QEDm))

#### Patient search
Servers are required to support Patient search parameters as follows:

| Parameter  | Clinical Data Provider | IPA    | PDQm  |
|------------|------------------------|--------|-------|
| _id        | SHOULD                 | SHALL  | SHALL | 
| identifier | SHALL                  | SHOULD | SHALL |

#### AllergyIntolerance search
Servers are required to support AllergyIntolerance search parameters as follows:

| Parameter       | Clinical Data Provider | IPA    | QEDm  |
|-----------------|------------------------|--------|-------|
| _id             | SHOULD                 | MAY    | MAY   | 
| patient         | SHALL                  | SHALL  | SHALL | 
| clinical-status | SHOULD                 | SHOULD | MAY   | 
| date            | SHOULD                 | MAY    | MAY   | 
| last-date       | SHOULD                 | MAY    | MAY   | 

#### Immunization search
Servers are required to support Immunization search parameters as follows:

| Parameter | Clinical Data Provider | IPA    | QEDm  |
|-----------|------------------------|--------|-------|
| _id       | SHOULD                 | MAY    | MAY  |
| patient   | SHALL                  | SHALL  | SHALL | 
| status    | SHOULD                 | SHOULD | MAY   | 
| date      | SHOULD                 | SHOULD | MAY   | 

#### MedicationAdministration search
Servers are required to support MedicationAdministration search parameters as follows:

| Parameter      | Clinical Data Provider | IPA | QEDm |
|----------------|------------------------|-----|------|
| _id            | SHOULD                 | MAY | MAY  |
| patient        | SHALL                  | MAY | MAY  | 
| status         | SHALL                  | MAY | MAY  | 
| effective-time | SHOULD                 | MAY | MAY  | 

#### MedicationDispense search
Servers are required to support MedicationDispense search parameters as follows:

| Parameter    | Clinical Data Provider | IPA | QEDm |
|--------------|------------------------|-----|------|
| _id          | SHOULD                 | MAY | MAY  |
| patient      | SHALL                  | MAY | MAY  | 
| status       | SHALL                  | MAY | MAY  | 
| whenprepared | SHOULD                 | MAY | MAY  | 

#### MedicationRequest search
Servers are required to support MedicationRequest search parameters as follows:

| Parameter  | Clinical Data Provider | IPA    | QEDm    |
|------------|------------------------|--------|---------|
| _id        | SHOULD                 | MAY    | MAY     |
| patient    | SHALL                  | SHALL  | SHALL   | 
| status     | SHALL                  | SHOULD | MAY     | 
| authoredon | SHOULD                 | SHOULD | MAY     | 

#### MedicationStatement search
Servers are required to support MedicationStatement search parameters as follows:

| Parameter | Clinical Data Provider | IPA    | QEDm  |
|-----------|------------------------|--------|-------|
| _id       | SHOULD                 | MAY    | MAY  |
| patient   | SHALL                  | SHALL  | SHALL | 
| status    | SHALL                  | SHOULD | MAY   | 
| effective | SHOULD                 | MAY    | MAY   | 