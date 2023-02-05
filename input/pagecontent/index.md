# UKCore Access
This HL7 FHIR Implementation Guide specifies the requirements for a RESTful endpoint providing read-only access for direct care
and subject of care access within the UK. It uses UK-specific resource profiles defined in the
[UK Core 1.0.0](https://simplifier.net/guide/uk-core-implementation-guide/Home?version=1.0.0) implementation guide.

### Actors
**Provider**: Implements a FHIR RESTful API providing the UKCore Access [capabilities](./CapabilityStatement-UKCoreAccess.html)

**Consumer**: Requests information from the Provider

### Prerequisites
#### Locating a FHIR Server
It is assumed that Consumers will retrieve the URLs for FHIR RESTful endpoints implemented by Providers from sources such as:
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
- Rik Smithies 
