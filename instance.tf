resource "aws_instance" "docker" {
    ami = "ami-0c8e23f950c7725b9"
    instance_type = "t2.medium"
    security_groups = ["My-traffic"]
    key_name = "gaureshnew"
    user_data = <<EOF
    #!/bin/bash
    sudo yum install git -y
    sudo yum install java-17-amazon-corretto -y
    sudo yum search docker
    sudo yum info docker 
    sudo yum install docker -y
    sudo newgrp docker
    sudo -a -G docker ec2-user
    sudo systemctl enable --now docker
    EOF
    tags = {
        Name = "docker"
    }
}
