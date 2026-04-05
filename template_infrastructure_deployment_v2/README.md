# TEMPLATE INFRASTRUCTURE DEPLOYMENT V2

## Purpose
- Provide a clean and reusable infrastructure-to-cluster-to-node deployment template chain.
- Preserve report-generation behavior at every level (infrastructure, cluster, role/node).
- Fix variable/path mismatches found in the legacy template set.

## Legacy Review Findings (From template_ansible_deployment)
- Infrastructure level issues:
  - Report file was copied to `<deploy_process>_install.json` but edited with `<role_process>.json` in one task.
  - Report update task used variable names (`deploy_01_status`) that were never registered.
  - Hardcoded owner/group path segments referenced `/home/emh/...` instead of `/home/{{ user }}/...`.
- Cluster level issues:
  - Report copied as `<cluster_process>_install.json` but later edits targeted `<cluster_process>.json`.
  - Include/report sequence relied on inconsistent variable naming.
- Role level issues:
  - Play 22 name referenced `playbook12` instead of `playbook22`.
  - Reporting logic was very repetitive and difficult to maintain.

## V2 Improvements
- Introduced per-level `report_file` variables so each write targets one canonical path.
- Standardized register variable names and report field updates.
- Removed hardcoded user home path segments.
- Added clear comments and structured tasks for onboarding and walkthroughs.
- Kept reporting sections at each level to maintain compatibility with your current reporting model.

## Structure
- `template_infrastructure_main_v2.yml`
- `template_infrastructure_variables_v2.yml`
- `template_report.json`
- `template_cluster_deployment_v2/`
  - `template_cluster_main_v2.yml`
  - `template_cluster_variables_v2.yml`
  - `template_report.json`
  - `template_role_v2/`
    - `template_role_main_v2.yml`
    - `template_role_variables_v2.yml`
    - `template_report.json`

## Quick Simulated Validation
- Syntax check examples:
  - `ansible-playbook --syntax-check fullstack/ansible/template_infrastructure_deployment_v2/template_infrastructure_main_v2.yml`
  - `ansible-playbook --syntax-check fullstack/ansible/template_infrastructure_deployment_v2/template_cluster_deployment_v2/template_cluster_main_v2.yml`
  - `ansible-playbook --syntax-check fullstack/ansible/template_infrastructure_deployment_v2/template_cluster_deployment_v2/template_role_v2/template_role_main_v2.yml`