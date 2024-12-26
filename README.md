# Overview

This Terraform module automates the provisioning and configuration of an Azure Function App codebase within a specified GitHub repository. Building upon the foundational Azure Function Core module, it leverages the resources provisioned by the core module as data sources to create a robust, scalable, and secure function app infrastructure. The module sets up essential Terraform configuration files, including core.tf, main.tf, outputs.tf, regions.tf, variables.tf, and versions.tf, ensuring a standardized project structure. 

Additionally, it configures environment-specific Terraform variable files (terraform.tfvars) and regional stamp modules that provision Azure Function Apps tailored to either Windows or Linux environments based on the specified OS type. Each regional stamp includes a user-assigned managed identity, necessary role assignments granting access to regional Key Vaults and storage accounts, and App Insights health probes for monitoring. 

By managing these configurations through Terraform and committing them to the GitHub repository, the module ensures consistent, repeatable, and secure deployments of Azure Function Apps, seamlessly integrating within the GitHub AT-AT framework for efficient automation of Terraform and Azure-based projects.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [github_repository_file.gitignore](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |
| [github_repository_file.modules_folder](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |
| [github_repository_file.root_folder](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |
| [github_repository_file.terraform_tfvars](https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_branch"></a> [branch](#input\_branch) | The branch of the GitHub repository where the Azure Function App codebase configurations will be committed.<br><br>Ensure that the specified branch exists in the repository and that the commit user has the necessary permissions to push changes to it. The branch specified here will be the target for all automated commits and updates made by the Terraform module. | `string` | n/a | yes |
| <a name="input_commit_user"></a> [commit\_user](#input\_commit\_user) | The Git identity used to commit the Terraform configuration files to the GitHub repository.<br><br>This includes:<br>- **`name`**: The name of the user committing the files.<br>- **`email`**: The email address of the user committing the files.<br><br>Ensure that the provided Git identity has the necessary permissions to push changes to the specified repository and branch. This identity will be used for all automated commits, so accuracy is essential to maintain a clear commit history. | <pre>object({<br>    name  = string<br>    email = string<br>  })</pre> | n/a | yes |
| <a name="input_core_name"></a> [core\_name](#input\_core\_name) | The name of the Azure Function Core module that this Function App codebase will build upon.<br><br>This name is used to reference the core module's resources as data sources within the Function App module. Ensuring consistency in naming helps in maintaining clear dependencies and resource associations between modules. | `string` | n/a | yes |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | The operating system type for the Azure Function App.<br><br>**Valid Values**:<br>- `Windows`<br>- `Linux`<br><br>This setting determines the underlying OS for the Function App, affecting compatibility with certain Azure services and runtime environments. Choose the OS type that best aligns with your application's requirements and dependencies. | `string` | n/a | yes |
| <a name="input_path"></a> [path](#input\_path) | The file system path within the GitHub repository where the Terraform configuration files and workflows will be stored.<br><br>This path determines the directory structure in the repository, organizing configuration files for better manageability. Properly structuring the path helps in maintaining a clean and navigable repository, especially when dealing with multiple environments and modules. | `string` | `"src/terraform"` | no |
| <a name="input_primary_location"></a> [primary\_location](#input\_primary\_location) | The primary Azure region where the Azure Function app and its in-region resources will be deployed.<br><br>**Examples**: `eastus`, `westeurope`, `southeastasia`<br><br>Selecting an appropriate primary location is crucial for optimizing latency, compliance, and availability of your Azure resources. The primary location serves as the central hub for resources that are shared across multiple regional deployments. | `string` | n/a | yes |
| <a name="input_repository"></a> [repository](#input\_repository) | The name of the GitHub repository where the Azure Function App codebase configurations will be managed.<br><br>This repository will store the Terraform configuration files necessary for provisioning and managing the Azure Function Apps across multiple regions. Ensuring that the repository name is correctly specified is crucial for the module to locate and manage the appropriate codebase. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_path"></a> [path](#output\_path) | n/a |
<!-- END_TF_DOCS -->