module "project" {
  source = "registry.terraform.io/telekom-mms/core/azuredevops"
  project = {
    proj-mms-github = {
      description = "Project for full example"
    }
  }
}

module "repositories" {
  source = "registry.terraform.io/telekom-mms/repository/azuredevops"

  git_repository = {
    # Minimal configuration (Uninitialized)
    repo-default = {
      project_id = module.project.project["proj-mms-github"].id
      initialization = {
        init_type = "Uninitialized"
      }
    }

    # Clean initialization with default branch and explicit name
    repo-clean = {
      name           = "repo-clean-mms"
      project_id     = module.project.project["proj-mms-github"].id
      default_branch = "refs/heads/develop"
      initialization = {
        init_type   = "Clean"
        source_type = "Git"
      }
    }
  }
}
