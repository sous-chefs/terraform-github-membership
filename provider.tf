terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "~> 4.0"
    }
  }
  required_version = ">= 1.0.0"

  backend "remote" {
    organization = "sous-chefs"
    workspaces {
      name = "terraform-github-membership"
    }
  }
}

provider "github" {
  owner = "sous-chefs"
}
