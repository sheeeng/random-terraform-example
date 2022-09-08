resource "random_id" "identifier" {
  byte_length = 8
  keepers = {
    uuid = uuid()
  }
  # prefix = ""
}

output "identifier" {
  value = random_id.identifier
}

resource "random_integer" "number" {
  min = 1
  max = 100
  keepers = {
    uuid = uuid()
  }
  # seed = ""
}

output "number" {
  value = random_integer.number.result
}

resource "random_password" "passphrase" {
  length = 16
  keepers = {
    uuid = uuid()
  }
  # lower = ""
  # min_lower = ""
  # min_numeric = ""
  # min_special = ""
  # min_upper = ""
  # number = ""
  # override_special = ""
  # special = ""
  # upper = ""
}

output "passphrase" {
  value     = random_password.passphrase.result
  sensitive = true
}

resource "random_pet" "metazoa" {
  keepers = {
    uuid = uuid()
  }
  # length = 2
  # prefix = ""
  # separator = ""
}

output "metazoa" {
  value = random_pet.metazoa.id
}

resource "random_shuffle" "card_suits" {
  input = ["Hearts", "Diamonds", "Clubs", "Spades"]
  keepers = {
    uuid = uuid()
  }
  # result_count = ""
  # seed = ""
}

output "card_suits" {
  value = random_shuffle.card_suits.result
}

resource "random_string" "alphanumeric" {
  length = 8
  keepers = {
    uuid = uuid()
  }
  # lower = ""
  # min_lower = ""
  # min_numeric = ""
  # min_special = ""
  # min_upper = ""
  # number = ""
  # override_special = ""
  # special = ""
  # upper = ""
}

output "alphanumeric" {
  value = random_string.alphanumeric.result
}

resource "random_uuid" "unique_identifier" {
  keepers = {
    uuid = uuid()
  }
}

output "unique_identifier" {
  value = random_uuid.unique_identifier.result
}
