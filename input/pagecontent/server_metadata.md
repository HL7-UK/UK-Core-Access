TODO: Do we need to consider a Consumer page?

#### Consumer
A Consumer MAY use the CapabilityStatement during implementation to discover the capabilities of a FHIR endpoint provided by a UKCore Access Provider.

A Consumer MAY retrieve the CapabilityStatement at runtime to discover the current capabilities of a FHIR endpoint and 
to adapts to changes in capability. For example:
- a Provider may be experiencing failures within their system so that some capabilities are temporarily unavailable 
- a Provider may start to provide new capabilities
