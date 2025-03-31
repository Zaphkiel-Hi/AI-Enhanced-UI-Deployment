resource "aws_instance" "jenkins-server" {
  ami                    = "ami-0f58b397bc5c1f2e8"  # Replace if needed
  instance_type          = "t3.medium"
  key_name               = "HIRITHIK395"  # Your key pair name
  subnet_id = "subnet-05b2040ee3401ace2"  # Public subnet 1
  vpc_security_group_ids = ["sg-07e6c7e476868fb59"]  # Default security group

  tags = {
    Name = "Jenkins-server"
  }
}
