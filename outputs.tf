output "random_id_identifier" {
  value = random_id.identifier
}

output "random_integer_number_result" {
  value = random_integer.number.result
}

output "random_password_passphrase_result" {
  value     = random_password.passphrase.result
  sensitive = true
}

output "random_pet_metazoa_id" {
  value = random_pet.metazoa.id
}

output "random_shuffle_card_suits_result" {
  value = random_shuffle.card_suits.result
}

output "random_string_alphanumeric_result" {
  value = random_string.alphanumeric.result
}

output "random_uuid_unique_identifier_result" {
  value = random_uuid.unique_identifier.result
}
