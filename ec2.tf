// ec2 instance code

resource "aws_instance" "server" {
  ami                    = "ami-045269a1f5c90a6a0"
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public1.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  key_name               = aws_key_pair.key1.key_name // reference to the keypair created in keypair.tf
  user_data              = file("setup.sh")

  tags = {
    Name = "Terraform-Project-server"
    env  = "dev"

  }
}
// EBS volume attachment to the instance
resource "aws_ebs_volume" "ebs" {
  availability_zone = aws_instance.server.availability_zone
  size              = 20 // size in GB
  tags = {
    Name = "Extra-volume"
  
  }
}
resource "aws_volume_attachment" "attach" {
  instance_id = aws_instance.server.id
  volume_id = aws_ebs_volume.ebs.id
  device_name = "/dev/sdb"
}