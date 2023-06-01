terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = ">= 3.5.1, < 4.0.0"
    }
  }
  required_version = ">= 1.0.0"
}
