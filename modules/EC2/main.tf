resource "aws_instance" "this" {
  ami           = "ami-03caad32a158f72db"
  instance_type = var.instance_type
  
  tags = {
    Name = "successfull EC2 Instance"
  }
}
