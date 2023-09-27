provider "vault" {
  address = "http://127.0.0.1:8200"
  skip_tls_verify = true
  token = "education"
}

data "vault_generic_secret" "vault_example" {
  path = "secret/example"
}

resource "vault_generic_secret" "vault_example2" {
  path      = "secret/example2"
  data_json = <<EOT
{
  "foo": "bar"
}
EOT
}

output "vault_exmaple" {
  value = nonsensitive(data.vault_generic_secret.vault_example.data)
}

output "vault_exmaple2" {
  value = nonsensitive(vault_generic_secret.vault_example2.data)
}