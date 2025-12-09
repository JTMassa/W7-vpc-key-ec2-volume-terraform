// create keypair
resource "tls_private_key" "key" { // the provider that creates the key
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key1" { //the key in aws
  key_name   = "terraform-key"
  public_key = tls_private_key.key.public_key_openssh
}
resource "local_file" "privatekey" { //the key you download
  filename        = "terraformkey.pem"
  file_permission = "0400"
  content         = tls_private_key.key.private_key_openssh
}