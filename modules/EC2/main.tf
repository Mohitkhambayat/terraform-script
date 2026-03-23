resource "aws_instance" "this" {
  ami           = "ami-051f8b2110b52e9f0"
  instance_type = var.instance_type
  
  tags = {
    Name = "successfull EC2 Instance"
  }
}
