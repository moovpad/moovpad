# TEMPLATE ANSIBLE DATAMESH

## GOALS

- Develop a tempplate strategy for Ansible deployment of a datamesh
- Include the building of the database users, schemas, databases, tables, and policies
- Integrate SQL stored procedures to facilitate efficient ongoing datamesh management
- Develop the template datamesh structure to enable simple modification for different use cases
- Parse the necessary Ansible reports as template json files for cross-system analysis

## WHY USE TEMPLATE FILES?

- Modular approach to datamesh/datawarehouse design, development and deployment:
- Better aligns with necessary MOOVPAD CI/CD best-practice approaches
- Stanadardises communication between teams and facilitates more efficient collaboration

## SYSTEMS

- Although the approach for developing the templates in this repository are designed for MOOVPAD's specific needs, they are also generic enough to be adaptable to other applications
- Template datamesh components are designed to be useful across general data stores, system-based management functions, and various other roles.

## AUTOMATED REPORTING

At each level of the deployment, the template Ansible playboks include reporting tasks that utilise a template_rport.json file to enter results from the tasks based on register data. This template report format is universal and consistent at each level, with the relevant entries made by the tasks directly into a copy of this template. Once the report is generated, the final json file can be parsed into commonly available analysis tools or custom systems. MOOVPAD will be parsing these reports through multiple custom modules. This analysis will be made more efficient by the custom-built RServer and MServer modules which will scan the generated reports for things like first sign of errors in a deployment chain, environments and dependencies, and their configs, when errors occur, and more.