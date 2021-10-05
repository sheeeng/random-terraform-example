#!/usr/bin/env bash

# https://github.com/hashicorp/terraform/issues/27995#issuecomment-791524603

cd "$(mktemp -d)" || exit

mkdir wrap-sensitive

cat - >wrap-sensitive/wrap.tf <<'EOF'

variable "in" {
  sensitive = true
}

output "out" {
  value     = var.in
  sensitive = true
}

EOF

cat - >main.tf <<'EOF'

terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }
}

variable "config_secret" {
  sensitive = true
  default   = "password123"
}

resource "null_resource" "reveal_to_me_your_secrets" {
  triggers = {
    revealed_secret = random_password.tell_noone.result
    hidden_secret   = var.config_secret
    always_trigger  = timestamp()
    secret_id       = random_password.tell_noone.id
    workaround      = module.secret_workaround.out
  }
}

module "secret_workaround" {
  source = "./wrap-sensitive/"
  in     = random_password.tell_noone.result
}

resource "random_password" "tell_noone" {
  length           = 16
  special          = true
  override_special = "_%@"
}

EOF

terraform init
terraform apply -auto-approve
terraform plan
