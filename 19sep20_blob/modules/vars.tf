variable "permanent_infra_key_vault_name" {}
variable "permanent_infra_rg_name" {}
variable "davids_home_ip_secret_name" {}
variable "shanikas_home_ip_secret_name" {}
variable "rg1_name" {}
variable "git_repo_tag" {}
variable "rg1_location" {}
variable "sa1_name" {}
variable "environment_tag" {}
variable "container_values" {
  type = map(object({
    name        = string
    access_type = string
  }))
}

