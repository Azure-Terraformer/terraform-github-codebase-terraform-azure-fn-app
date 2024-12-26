variable "repository" {
  type        = string
  description = <<DESCRIPTION
The name of the GitHub repository where the Azure Function App codebase configurations will be managed.

This repository will store the Terraform configuration files necessary for provisioning and managing the Azure Function Apps across multiple regions. Ensuring that the repository name is correctly specified is crucial for the module to locate and manage the appropriate codebase.
DESCRIPTION
}
variable "branch" {
  type        = string
  description = <<DESCRIPTION
The branch of the GitHub repository where the Azure Function App codebase configurations will be committed.

Ensure that the specified branch exists in the repository and that the commit user has the necessary permissions to push changes to it. The branch specified here will be the target for all automated commits and updates made by the Terraform module.
DESCRIPTION
}
variable "path" {
  type        = string
  default     = "src/terraform"
  description = <<DESCRIPTION
The file system path within the GitHub repository where the Terraform configuration files and workflows will be stored.

This path determines the directory structure in the repository, organizing configuration files for better manageability. Properly structuring the path helps in maintaining a clean and navigable repository, especially when dealing with multiple environments and modules.
DESCRIPTION
}
variable "commit_user" {
  type = object({
    name  = string
    email = string
  })
  description = <<DESCRIPTION
The Git identity used to commit the Terraform configuration files to the GitHub repository.

This includes:
- **`name`**: The name of the user committing the files.
- **`email`**: The email address of the user committing the files.

Ensure that the provided Git identity has the necessary permissions to push changes to the specified repository and branch. This identity will be used for all automated commits, so accuracy is essential to maintain a clear commit history.
DESCRIPTION
}
variable "primary_location" {
  type        = string
  description = <<DESCRIPTION
The primary Azure region where the Azure Function app and its in-region resources will be deployed.

**Examples**: `eastus`, `westeurope`, `southeastasia`

Selecting an appropriate primary location is crucial for optimizing latency, compliance, and availability of your Azure resources. The primary location serves as the central hub for resources that are shared across multiple regional deployments.
DESCRIPTION
}
variable "os_type" {
  type        = string
  description = <<DESCRIPTION
The operating system type for the Azure Function App.

**Valid Values**:
- `Windows`
- `Linux`

This setting determines the underlying OS for the Function App, affecting compatibility with certain Azure services and runtime environments. Choose the OS type that best aligns with your application's requirements and dependencies.
DESCRIPTION
}
variable "core_name" {
  type        = string
  description = <<DESCRIPTION
The name of the Azure Function Core module that this Function App codebase will build upon.

This name is used to reference the core module's resources as data sources within the Function App module. Ensuring consistency in naming helps in maintaining clear dependencies and resource associations between modules.
DESCRIPTION
}
