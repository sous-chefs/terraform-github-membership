terraform {
  required_version = ">= 1.3.0"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }

  backend "remote" {
    organization = "sous-chefs"
    workspaces {
      name = "terraform-github-membership"
    }
  }
}

provider "github" {
  #   owner        = "sous-chefs"
  organisation = "sous-chefs"
}
