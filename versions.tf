terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">= 1.0.1"
    }
  }

  required_version = ">= 1.5"
}
