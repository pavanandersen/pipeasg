resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "deployer_key" {
  key_name   = "deployer_key"
  public_key = tls_private_key.example.public_key_openssh
}

output "private_key_pem" {
  value     = tls_private_key.example.private_key_pem
  sensitive = true
}
