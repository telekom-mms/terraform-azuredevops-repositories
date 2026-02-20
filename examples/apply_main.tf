module "project" {
  source = "registry.terraform.io/telekom-mms/core/azuredevops"
  project = {
    proj-mms-github = {
      description = "Project for minimal example"
    }
  }
}

module "repositories" {
  source = "registry.terraform.io/telekom-mms/repository/azuredevops"

  git_repository = {
    "repo-mms-github" = {
      project_id = module.project.project["proj-mms-github"].id
      initialization = {
        init_type = "Uninitialized"
      }
    }
  }
}
