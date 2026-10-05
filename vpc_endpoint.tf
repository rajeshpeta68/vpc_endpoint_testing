resource "aws_vpc_endpoint" "s3_endpoint" {
    vpc_id = aws_vpc.test-vpc.id
    service_name = "com.amazonaws.ap-south-2.s3"
    vpc_endpoint_type = "Gateway"

    route_table_ids = [ aws_route_table.test-private-route-1.id ]
  
}