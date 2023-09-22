resource "aws_instance" "trainingInstances" {
    ami = "ami-053b0d53c279acc90"
    instance_type = "t2.small"
    security_groups = [ "launch-wizard-1" ]
    key_name = "terraform"
  

    tags = {
      "Name" = "docker instance"
    }
  
}
resource "null_resource" "docker_install" {
  connection {
    type        = "ssh"
    user        = "ubuntu" # Change if necessary
    private_key = file("C:\\Formations\\terraform.pem") # Change to your SSH key path
    host        = aws_instance.trainingInstances.public_ip
  }
  
  provisioner "remote-exec" {
    inline = [
    "sudo apt-get remove docker docker-engine docker.io",
    "sudo apt-get update",
    "sudo apt -y install docker.io",
    "sudo snap -y install docker",
    "sudo systemctl start docker"
    ]
  }
  depends_on = [aws_instance.trainingInstances]
}

output "public_ip" {
  value = aws_instance.trainingInstances.public_ip
}