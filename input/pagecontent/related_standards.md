### Patient Index Provider
The Patient Index Provider capabilities in the UKCore Access implementation guide are closely related to patient search
defined in international interoperability standards including:
- [HL7 International Patient Access](https://build.fhir.org/ig/HL7/fhir-ipa/index.html)
- [IHE Patient Demographics Query for Mobile](https://profiles.ihe.net/ITI/PDQm/index.html)

Servers are required to support Patient search parameters as follows:

| Parameter  | Patient Index Provider | IPA    | PDQm  |
|------------|------------------------|--------|-------|
| _id        | SHOULD                 | SHOULD | SHALL | 
| identifier | SHALL                  | SHOULD | SHALL | 
| family     | SHOULD                 | SHOULD | SHALL | 
| given      | SHOULD                 | SHOULD | SHALL | 
| name       | SHOULD                 | SHOULD | SHALL |
| gender     | SHOULD                 | SHOULD | SHALL | 
| birthdate  | SHOULD                 | SHOULD | SHALL |

### Clinical Data Provider
The Clinical Data Provider capabilities in the UKCore Access implementation guide are closely related to clinical data retrieval
defined in international interoperability standards including:
- [HL7 International Patient Access](https://build.fhir.org/ig/HL7/fhir-ipa/index.html)
- [IHE Query for Existing Data for Mobile](https://wiki.ihe.net/index.php/Query_for_Existing_Data_for_Mobile_(QEDm))

Servers are required to support Patient search parameters as follows:

| Parameter  | Clinical Data Provider | IPA    | PDQm  |
|------------|------------------------|--------|-------|
| _id        | SHOULD                 | SHOULD | SHALL | 
| identifier | SHALL                  | SHOULD | SHALL |

Servers are required to support AllergyIntolerance search parameters as follows:

| Parameter       | Clinical Data Provider | IPA    | QEDm  |
|-----------------|------------------------|--------|-------|
| patient         | SHALL                  | SHALL  | SHALL | 
| clinical-status | SHOULD                 | SHOULD | MAY   | 
| date            | SHOULD                 | MAY    | MAY   | 
| last-date       | SHOULD                 | MAY    | MAY   | 

Servers are required to support Immunization search parameters as follows:

| Parameter | Clinical Data Provider | IPA    | QEDm  |
|-----------|------------------------|--------|-------|
| patient   | SHALL                  | SHALL  | SHALL | 
| status    | SHOULD                 | SHOULD | MAY   | 
| date      | SHOULD                 | SHOULD | MAY   | 

Servers are required to support MedicationStatement search parameters as follows:

| Parameter | Clinical Data Provider | IPA    | QEDm  |
|-----------|------------------------|--------|-------|
| patient   | SHALL                  | SHALL  | SHALL | 
| status    | SHOULD                 | SHOULD | MAY   | 
| effective | SHOULD                 | MAY    | MAY   | 