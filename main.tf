/**
 * # repository
 *
 * This module manages Azure DevOps Repositories.
 *
 * For more information about the module structure see https://telekom-mms.github.io/terraform-template.
 *
*/

resource "azuredevops_git_repository" "git_repository" {
  for_each = var.git_repository

  project_id     = local.git_repository[each.key].project_id
  name           = local.git_repository[each.key].name == "" ? each.key : local.git_repository[each.key].name
  default_branch = local.git_repository[each.key].default_branch

  dynamic "initialization" {
    for_each = local.git_repository[each.key].initialization.init_type == "Import" ? [1] : []

    content {
      init_type             = local.git_repository[each.key].initialization.init_type
      source_type           = local.git_repository[each.key].initialization.source_type
      source_url            = local.git_repository[each.key].initialization.source_url
      service_connection_id = local.git_repository[each.key].initialization.service_connection_id
    }
  }

  dynamic "initialization" {
    for_each = local.git_repository[each.key].initialization.init_type != "Import" ? [1] : []

    content {
      init_type = local.git_repository[each.key].initialization.init_type
    }
  }
}
