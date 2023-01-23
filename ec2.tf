resource "aws_instance" "tb" {
  ami           = "ami-08234a0b8f9c757cf"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.TF_SG.name]
  key_name = "tf_key"
  # user_data = file("script.sh")

  tags = {
    Name = "Tomcat"
  }
}
