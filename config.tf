terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket    = "terraform-state"
    key       = "flareline-web.tfstate"
    endpoints = { s3 = var.cloudflare_state_endpoint }

  }
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
