# Data Pipelines (1) Project

# Final assignment

## Modeling of the XML database of a health insurance company. 
\
A member of the company has an electronic medical records (EMRs) within which general personal information is stored like age and weight, in addition to medication, allergies, immunization status, and medical history: consultations, surgeries, laboratory test results, etc., and billing information. Employees of the insurance company are managing the financial aspects of EMRs (reimbursement of mecidal expenses, according to the status of company members and medical prescriptions). Referring physicians and specialist physicians are managing the medical part of their patients EMRs (prescription of laboratory tests and medical acts, execution of these acts according to prescriptions).
\
\
***This general description is indicative, it is up to you to decide of your precise model.***
\
- Describe your modeling choices in natural language. Think about the advantages and disadvantages of your choices and discuss them.
- Write an XML Schema that represents your modeling.
- Write a valid XML document against this model, containing a representative extract of the data of the health insurance company.
- Imagine (t least) 3 different scenarios requiring the visualization of some of this data and write 3 XSL stylesheets to answer them.
- Imagine (at least) a 4th scenario requiring the exploitation of part of this data in a new structure and write a stylesheet for this.
- Optional: Write a JSON document and a JSON schema providing an alternative structuring of the data of the insurance company.
\
\
You will be evaluated according to the quality and richness of your modeling, to the quality and richness of the imagined scenarios and the quality of your stylesheets implementing them (prefer a recursive XSL programming style that extensively uses XPath).
\
\
Upload a zip file containing:
\
- A report of max 4 pages in pdf format presenting:
- your modeling choices in XML, and the advantages and disadvantages of your choices for the processing of the data
- your use cases and the XSLT transformations implemented to answer them
- optionaly: your modeling choices in JSON and a comparison of it with your XML model
\
\
Also precisely indicate in your report your working environment, and the tools or online services you have used.
- your source XML file
- your XML Schema file
- your XSLT files containing comments describing your transformations in natural language
- optional: your JSON file
- optional: your JSON Schema file
