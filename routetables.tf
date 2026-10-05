resource "aws_route_table" "test-public-route-1" {
    vpc_id = aws_vpc.test-vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.test-igw.id
    }

    tags = {
        Name = "test-public-route-1"
    }
  
}

resource "aws_route_table_association" "test-public-route-association-1" {
    subnet_id = aws_subnet.test-public-subnet-1.id
    route_table_id = aws_route_table.test-public-route-1.id
  
}

resource "aws_route_table" "test-private-route-1" {
    vpc_id = aws_vpc.test-vpc.id

    tags = {
        Name = "test-private-route-1"
    }
    
  
}

resource "aws_route_table_association" "test-private-route-association" {
    subnet_id = aws_subnet.test-private-subnet.id
    route_table_id = aws_route_table.test-private-route-1.id
  
}