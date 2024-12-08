
# vpc
resource "aws_vpc" "my_vpc" {
  cidr_block = var.cidr
}

# subnet
resource "aws_subnet" "my_pub" {
  count = length(var.pub_cidr)
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = element(var.pub_cidr, count.index)
  availability_zone = element(var.ava_zone, count.index)
}

# internet gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
}

# route table
resource "aws_route_table" "my_rt" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
}


# subnet and route table assosiation
resource "aws_route_table_association" "my_asso" {
  count = length(var.pub_cidr)
  subnet_id      = aws_subnet.my_pub[count.index].id
  route_table_id = aws_route_table.my_rt.id
}