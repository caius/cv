terraform {
  required_version = "~> 1.10.0"

  required_providers {
    vercel = {
      source  = "vercel/vercel"
      version = "3.8.0"
    }
  }
}

provider "vercel" {}
