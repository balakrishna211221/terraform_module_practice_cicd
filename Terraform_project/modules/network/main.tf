resource "aws_vpc" "this" {
  cidr_block = var.cidr_block

  tags = {
    Name = var.Name
  }
}

resource "aws_subnet" "this" {
  count = var.subnet_count

  vpc_id     = aws_vpc.this.id
  cidr_block = element(var.subnet_cidrs, count.index)

  tags = {
    Name = "${var.Name}-subnet-${count.index}"
  }
}
