Instance: Example-UKCore-Patient-RichardSmith
InstanceOf: Patient
Description: "Example patient Richard Smith"
* id = "57bae551-2c5d-4def-a541-4b156ec49497"
* meta
  * profile = Canonical(https://fhir.hl7.org.uk/StructureDefinition/UKCore-Patient)
* identifier[+]
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9912003888"
  * extension
    * url = Canonical(https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-NHSNumberVerificationStatus)
    * valueCodeableConcept
      * coding = https://fhir.hl7.org.uk/CodeSystem/UKCore-NHSNumberVerificationStatusEngland#01 "Number present and verified"
* identifier[+]
  * system = "https://fhir.provider.nhs.uk/Id/pas-identifier"
  * value = "12345"
* name
  * use = #official
  * family = "SMITH"
  * given = "Richard"
* telecom
  * system = #phone
  * value = "01131231234"
* gender = #male
* birthDate = "1970-09-11"

Instance: Example-UKCore-Patient-MaryMorris
InstanceOf: Patient
Description: "Example patient MaryMorris"
* id = "b88f0099-5213-4502-a49d-cc3887027bdd"
* meta
  * profile = Canonical(https://fhir.hl7.org.uk/StructureDefinition/UKCore-Patient)
* identifier[+]
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "4123456879"
  * extension
    * url = Canonical(https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-NHSNumberVerificationStatus)
    * valueCodeableConcept
      * coding = https://fhir.hl7.org.uk/CodeSystem/UKCore-NHSNumberVerificationStatusEngland#01 "Number present and verified"
* identifier[+]
  * system = "https://fhir.another-provider.nhs.uk/Id/pas-identifier"
  * value = "12345"
* name
  * use = #official
  * family = "MORRIS"
  * given = "Mary"
* gender = #female
* birthDate = "1972-10-07"

Instance: Example-UKCoreAccess-Bundle-patientsearchbynhsnumber
InstanceOf: Bundle
Description: "Result of searching for a patient by NHS Number"
* type = #searchset
* link
  * relation = "self"
  * url = "https://fhir.provider.nhs.uk/Patient?identifier=https://fhir.nhs.uk/Id/nhs-number|9912003888"
* entry
  * fullUrl = "https://fhir.provider.nhs.uk/Patient/57bae551-2c5d-4def-a541-4b156ec49497"
  * search
    * mode = #match
  * resource = Example-UKCore-Patient-RichardSmith

Instance: Example-UKCoreAccess-Bundle-patientsearchbylocalsystem
InstanceOf: Bundle
Description: "Result of searching for a patient by local system"
* type = #searchset
* link
  * relation = "self"
  * url = "https://fhir.provider.nhs.uk/Patient?identifier=https://fhir.provider.nhs.uk/Id/pas-identifier|12345"
* entry
  * fullUrl = "https://fhir.provider.nhs.uk/Patient/57bae551-2c5d-4def-a541-4b156ec49497"
  * search
    * mode = #match
  * resource = Example-UKCore-Patient-RichardSmith

Instance: Example-UKCoreAccess-Bundle-patientsearchbyidentifiervalue
InstanceOf: Bundle
Description: "Result of searching for a patient by identifier value"
* type = #searchset
* link
  * relation = "self"
  * url = "https://fhir.provider.nhs.uk/Patient?identifier=12345"
* entry[+]
  * fullUrl = "https://fhir.provider.nhs.uk/Patient/57bae551-2c5d-4def-a541-4b156ec49497"
  * search
    * mode = #match
  * resource = Example-UKCore-Patient-RichardSmith
* entry[+]
  * fullUrl = "https://fhir.provider.nhs.uk/Patient/b88f0099-5213-4502-a49d-cc3887027bdd"
  * search
    * mode = #match
  * resource = Example-UKCore-Patient-MaryMorris