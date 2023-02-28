# UKCore Access
This HL7 FHIR Implementation Guide specifies the requirements for a RESTful endpoint providing read-only access for direct care
and subject of care access within the UK. It uses UK-specific resource profiles defined in the
[UK Core 1.0.0](https://simplifier.net/guide/uk-core-implementation-guide/Home?version=1.0.0) implementation guide.

Data Controllers holding personal data related to health and care may provide the capabilities specified in this
implementation guide when implementing systems to allow authenticated and authorised consumers to access the data.
The implementation guide is intended to be compatible with **all** systems used to manage care provision. Language
specific to the health domain, such as 'Patient', is used for technical reasons but there is no reason that these
APIs shouldn't be used in other domains where different terms for the subject of care may be normally used.

### Actors
The following Actors participate in the interactions described in this implementation guide:

| Actors                                         | Role                                                                                                                                                           |
|------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Patient Index](./patient_index.html) Provider | Instantiates a FHIR RESTful API endpoint providing the UKCore Access Patient Index [capabilities](./CapabilityStatement-UKCoreAccessPatientIndexProvider.html) |
| [Clinical Data](./clinical_data.html) Provider | Instantiates a FHIR RESTful API endpoint providing the UKCore Access Clinical Data [capabilities](./CapabilityStatement-UKCoreAccessClinicalDataProvider.html) |
| Consumer                                       | Requests information from one or more Providers                                                                                                                |

A FHIR RESTful API endpoint may provide the capabilities of one or more Actors, provided that it satisfies the requirements for each Actor.
For example, an endpoint may be both a Patient Index Provider AND Clinical Data Provider.

### Locating a FHIR Server
It is assumed that Consumers will discover the URLs of FHIR RESTful endpoints from sources including:
- local configuration
- local, regional or national directory services

### License
Copyright 2023 HL7 UK

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

### Contributors
This project is supported by [HL7 UK](https://www.hl7.org.uk/) with contributions from:
- Mike Andersson
- Mark Frayne ([DHCW](https://dhcw.nhs.wales/))
- Dunmail Hodkinson ([Black Pear Software](https://blackpear.com))
- Richard Kavanagh ([Kainos](https://kainos.com))
- Omar Khan ([NHS Digital](https://digital.nhs.uk))
- Rik Smithies ([NProgram](http://nprogram.co.uk))
