module "python_sdk_exercises" {
  source                         = "../modules"
  permanent_infra_key_vault_name = "drh-infra-keyvault1"
  permanent_infra_rg_name        = "permanent_infra"
  davids_home_ip_secret_name     = "davids-home-ip"
  shanikas_home_ip_secret_name   = "shanikas-home-ip"
  rg1_name                       = "19sep20blob"
  git_repo_tag = "https://github.com/drhbigdave/az_sdk_exercise"
  rg1_location                   = "East US"
  sa1_name                       = "pythonexercies"
  environment_tag                = "azure_sdk"
  container_values = {
    blob_source = {
      name        = "blobsource"
      access_type = "private"
    }
    blob_desintation = {
      name        = "blobdestination"
      access_type = "private"
    }
  }
}
