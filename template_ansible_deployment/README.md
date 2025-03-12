# TEMPLATE ANSIBLE DEPLOYMENT

## GOALS

- Establish a central repository for Ansible deployments based on template-based cluster rollouts
- Branch this central repository as necessary for specific cluster functions
- Utilise best-practice CI/CD pipeline methodologies for the deployment of updated playbooks
- Incorporate reporting into each level of the deployment, using task-based register data
- Parse these reports as template json files for cross-system analysis

## WHY USE TEMPLATE FILES?

- Modular approach:
    - Report initiation
    - Initial playbook tasks
    - Primary functional tasks
    - Report data entry and finalisation

- Better aligns with CI/CD best-practice approaches
- Stanadardises communication between teams and facilitates more efficient collaboration

## SYSTEMS

- Each deployment will be designed to be run against a specific type of system, negating the need to account for operating system differences in a deployment
- Systems may include physical servers, virtual machines, workstations, and portable devices

## DEPLOYMENT FILES

TEMPLATE LOCAL.YML

As with Ansible's established 'ansible-pull' default, this template will be the primary index for a cluster, used to define the deployment.

TEMPLATE VARS.YML

This variables file allows for the modification of cluster configuration for factors such as node count in a cluster, specific user configurations, security settings, etc.

## TEMPLATE CLUSTER

Clusters, as used by MOOVPAD in this approach, may include overall functions such as data, web server, systems management, and so on. Each such cluster will be composed of a set of 'roles' that will be focused on specific components of a cluster. For example, a data cluster may require Wireguard secure tunnels (currently planned to be a universal feature across all MOOVPAD cluster), OpenSSL, proxy server, etc.

## TEMPLATE ROLE

The main purpose of these template files, as for all higher-level templates, is to establish a primary structure that incorporates automated report generation, as well as the role-level Ansible playbooks and associated files.

## AUTOMATED REPORTING

At each level of the deployment, the template Ansible playboks include reporting tasks that utilise a template_rport.json file to enter results from the tasks based on register data. This template report format is universal and consistent at each level, with the relevant entries made by the tasks directly into a copy of this template. Once the report is generated, the final json file can be parsed into commonly available analysis tools or custom systems. MOOVPAD will be parsing these reports through multiple custom modules. This analysis will be made more efficient by the custom-built RServer and MServer modules which will scan the generated reports for things like first sign of errors in a deployment chain, environments and dependencies, and their configs, when errors occur, and more.