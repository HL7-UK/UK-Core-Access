Instance: RichardSmith
InstanceOf: Patient
Description: "Example patient Richard Smith"
* id = "57bae551-2c5d-4def-a541-4b156ec49497"
* identifier[+]
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9912003888"
  * extension
    * url = Canonical(https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-NHSNumberVerificationStatus)
    * valueCodeableConcept
      * coding = https://fhir.hl7.org.uk/CodeSystem/UKCore-NHSNumberVerificationStatusEngland#01 "Number present and verified"
* identifier[+]
  * system = "https://fhir.example-provider.nhs.uk/Id/pas-identifier"
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

Instance: MichaelSmithies
InstanceOf: Patient
Description: "Example patient Michael Smithies"
* id = "9708ceae-ddc8-49d2-97c1-f6f161e0104a"
* identifier[+]
  * system = "https://fhir.nhs.uk/Id/nhs-number"
  * value = "9912003814"
  * extension
    * url = Canonical(https://fhir.hl7.org.uk/StructureDefinition/Extension-UKCore-NHSNumberVerificationStatus)
    * valueCodeableConcept
      * coding = https://fhir.hl7.org.uk/CodeSystem/UKCore-NHSNumberVerificationStatusEngland#01 "Number present and verified"
* name
  * use = #official
  * family = "SMITHIES"
  * given = "Michael"
* telecom
  * system = #phone
  * value = "01131239876"
* gender = #male
* birthDate = "1972-08-12"

Instance: MaryMorris
InstanceOf: Patient
Description: "Example patient MaryMorris"
* id = "b88f0099-5213-4502-a49d-cc3887027bdd"
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

Instance: Response-patientsearchbynhsnumber
InstanceOf: Bundle
Description: "Result of searching for a patient by NHS Number"
* type = #searchset
* link
  * relation = "self"
  * url = "https://fhir.example-provider.nhs.uk/Patient?identifier=https://fhir.nhs.uk/Id/nhs-number|9912003888"
* entry
  * fullUrl = "https://fhir.example-provider.nhs.uk/Patient/57bae551-2c5d-4def-a541-4b156ec49497"
  * search
    * mode = #match
  * resource = RichardSmith

Instance: Response-patientsearchbylocalsystem
InstanceOf: Bundle
Description: "Result of searching for a patient by local system"
* type = #searchset
* link
  * relation = "self"
  * url = "https://fhir.example-provider.nhs.uk/Patient?identifier=https://fhir.example-provider.nhs.uk/Id/pas-identifier|12345"
* entry
  * fullUrl = "https://fhir.example-provider.nhs.uk/Patient/57bae551-2c5d-4def-a541-4b156ec49497"
  * search
    * mode = #match
  * resource = RichardSmith

Instance: Response-patientsearchbyidentifiervalue
InstanceOf: Bundle
Description: "Result of searching for a patient by identifier value"
* type = #searchset
* link
  * relation = "self"
  * url = "https://fhir.example-provider.nhs.uk/Patient?identifier=12345"
* entry[+]
  * fullUrl = "https://fhir.example-provider.nhs.uk/Patient/57bae551-2c5d-4def-a541-4b156ec49497"
  * search
    * mode = #match
  * resource = RichardSmith
* entry[+]
  * fullUrl = "https://fhir.example-provider.nhs.uk/Patient/b88f0099-5213-4502-a49d-cc3887027bdd"
  * search
    * mode = #match
  * resource = MaryMorris

Instance: Response-patientsearchbyid
InstanceOf: Bundle
Description: "Result of searching for a patient by logical id"
* type = #searchset
* link
  * relation = "self"
  * url = "https://fhir.example-provider.nhs.uk/Patient?_id=b88f0099-5213-4502-a49d-cc3887027bdd"
* entry[+]
  * fullUrl = "https://fhir.example-provider.nhs.uk/Patient/b88f0099-5213-4502-a49d-cc3887027bdd"
  * search
    * mode = #match
  * resource = MaryMorris

Instance: Response-patientsearchbybirthdate
InstanceOf: Bundle
Description: "Result of searching for a patient by identifier value"
* type = #searchset
* link
  * relation = "self"
  * url = "https://fhir.example-provider.nhs.uk/Patient?birthdate=1970-09-11"
* entry[+]
  * fullUrl = "https://fhir.example-provider.nhs.uk/Patient/57bae551-2c5d-4def-a541-4b156ec49497"
  * search
    * mode = #match
  * resource = RichardSmith

Instance: Response-patientsearchbyfamily
InstanceOf: Bundle
Description: "Result of searching for a patient by family name"
* type = #searchset
* link
  * relation = "self"
  * url = "https://fhir.example-provider.nhs.uk/Patient?family=Smith"
* entry[+]
  * fullUrl = "https://fhir.example-provider.nhs.uk/Patient/57bae551-2c5d-4def-a541-4b156ec49497"
  * search
    * mode = #match
  * resource = RichardSmith
* entry[+]
  * fullUrl = "https://fhir.example-provider.nhs.uk/Patient/9708ceae-ddc8-49d2-97c1-f6f161e0104a"
  * search
    * mode = #match
  * resource = MichaelSmithies

Instance: Response-patientsearchbygiven
InstanceOf: Bundle
Description: "Result of searching for a patient by given name"
* type = #searchset
* link
  * relation = "self"
  * url = "https://fhir.example-provider.nhs.uk/Patient?given=Rich"
* entry[+]
  * fullUrl = "https://fhir.example-provider.nhs.uk/Patient/57bae551-2c5d-4def-a541-4b156ec49497"
  * search
    * mode = #match
  * resource = RichardSmith

Instance: Response-patientsearchbygender
InstanceOf: Bundle
Description: "Result of searching for a patient by given name"
* type = #searchset
* link
  * relation = "self"
  * url = "https://fhir.example-provider.nhs.uk/Patient?gender=female"
* entry[+]
  * fullUrl = "https://fhir.example-provider.nhs.uk/Patient/b88f0099-5213-4502-a49d-cc3887027bdd"
  * search
    * mode = #match
  * resource = MaryMorris


Instance: Response-patientsearchbyname
InstanceOf: Bundle
Description: "Result of searching for a patient by part of name"
* type = #searchset
* link
  * relation = "self"
  * url = "https://fhir.example-provider.nhs.uk/Patient?name=Rich"
* entry[+]
  * fullUrl = "https://fhir.example-provider.nhs.uk/Patient/57bae551-2c5d-4def-a541-4b156ec49497"
  * search
    * mode = #match
  * resource = RichardSmith