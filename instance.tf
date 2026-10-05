resource "aws_instance" "test-public-instance" {
    subnet_id = aws_subnet.test-public-subnet-1.id
    vpc_security_group_ids = [ aws_security_group.web-sg.id ]
    instance_type = "t3.micro"
    ami = data.aws_ami.amazon_linux.id
    associate_public_ip_address = true

    key_name = "base"

    tags = {
        Name = "test-public-server-1"
    }

    connection {
      type = "ssh"
      user = "ec2-user"
      private_key = file("${path.module}/base.pem")
      host = self.public_ip
    }

    provisioner "file" {
        source = "${path.module}/base.pem"
        destination = "/home/ec2-user/base.pem"
      
    }

    provisioner "remote-exec" {
        inline = [
            "sudo chown ec2-user:ec2-user /home/ec2-user/base.pem",
            "sudo chmod 400 /home/ec2-user/base.pem"
        ]
        
      
    }
  
}

resource "aws_instance" "test-private-instance" {
    subnet_id = aws_subnet.test-private-subnet.id
    vpc_security_group_ids = [ aws_security_group.web-sg.id ]
    instance_type = "t3.micro"
    ami = data.aws_ami.amazon_linux.id

    key_name = "base"

    tags = {
        Name = "test-private-server-1"
    }  
}