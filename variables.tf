variable "repository" {
  type = string
}
variable "branch" {
  type = string
}
variable "path" {
  type    = string
  default = "src/terraform"
}
variable "commit_user" {
  type = object({
    name  = string
    email = string
  })
}
variable "primary_location" {
  type = string
}
