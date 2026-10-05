resource "aws_subnet" "test-public-subnet-1" {
    vpc_id = aws_vpc.test-vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-south-2a"

    tags = {
        Name = "test-public-subnet-1"
    }
  
}

resource "aws_subnet" "test-private-subnet" {
    vpc_id = aws_vpc.test-vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-south-2a"

    tags = {
        Name = "test-private-subnet-1"
    }
  
}


