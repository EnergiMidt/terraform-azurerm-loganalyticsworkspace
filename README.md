# azurerm_log_analytics_workspace

Manages a Log Analytics (formally Operational Insights) Workspace.

## Getting Started

- Review [.github/workflows/terraform.yml](.github/workflows/terraform.yml) GitHub Actions workflow.

- Terraform documentation will be automatically written with GitHub Actions.

- Always fetch latest changes from upstream and rebase from it.

```shell
git fetch --all --prune --prune-tags \
  && git pull --rebase --all --prune --tags
```

- Format and validate terraform code before commit.

```shell
terraform fmt -recursive .
terraform fmt -check
terraform validate .
```
