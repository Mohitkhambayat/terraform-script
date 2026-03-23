resource "aws_instance" "this" {
  ami           = "ami-0d76b909de1a0595d"
  instance_type = var.instance_type
  
  tags = {
    Name = "successfull EC2 Instance"
  }
}
