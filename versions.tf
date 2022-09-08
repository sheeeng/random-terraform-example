terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.4.2"
    }
  }
  required_version = ">= 1.2.8"
}
