resource "azurerm_resource_group" "rg1" {
  name     = var.rg1_name
  location = var.rg1_location
  tags = {
    git_repo        = var.git_repo_tag
    deploy_datetime = timestamp()
  }
}
