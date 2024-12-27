run "setup" {
  module {
    source = "./tests/setup"
  }
}

run "codebase" {
  module {
    source = "./"
  }

  variables {
    repository       = run.setup.repository_name
    branch           = "main"
    path             = "src"
    primary_location = "westus3"
    os_type          = "Windows"
    core_name        = "atat-core"
    commit_user = {
      name  = var.github_username
      email = var.github_email
    }
  }

}

run "final" {
  module {
    source = "./tests/final"
  }

  variables {
    endpoint = "https://www.github.com/${run.setup.username}/${run.setup.repository_name}/blob/main/README.md"
  }

  assert {
    condition     = data.http.readme.status_code == 200
    error_message = "GitHub with HTTP status ${data.http.readme.status_code}"
  }
}
