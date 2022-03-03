terraform {
  required_providers {
    github = {
      source = "integrations/github"
    }
  }
  required_version = ">= 1.0.0"

  backend "remote" {
    organization = "test-kitchen"
    workspaces {
      name = "terraform-github-membership"
    }
  }
}

provider "github" {
  owner = "test-kitchen"
}
