resource "aws_instance" "trainingInstances" {
    ami = "	ami-04b3c39a8a1c62b76"
    instance_type = "t2.micro"

    tags = {
      "Name" = "demoinstance"
    }
  
}