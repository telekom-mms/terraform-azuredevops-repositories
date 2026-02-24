output "git_repository" {
  description = "Outputs all attributes of azuredevops_git_repository."
  value = {
    for git_repository in keys(azuredevops_git_repository.git_repository) :
    git_repository => {
      for key, value in azuredevops_git_repository.git_repository[git_repository] :
      key => value
    }
  }
}

output "variables" {
  description = "Displays all configurable variables passed by the module. __default__ = predefined values per module. __merged__ = result of merging the default values and custom values passed to the module"
  value = {
    default = {
      for variable in keys(local.default) :
      variable => local.default[variable]
    }
    merged = {
      git_repository = {
        for git_repository in keys(var.git_repository) :
        git_repository => local.git_repository[git_repository]
      }
    }
  }
}
