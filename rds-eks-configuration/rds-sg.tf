resource "aws_security_group" "eks-rds-db-sg" {
  name        = "eks-rds-db-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.demo.id

  ingress {
    description = "TLS from VPC"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.demo.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "eks-rds-db-sg"
  }
}