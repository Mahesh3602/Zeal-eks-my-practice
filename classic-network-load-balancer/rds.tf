resource "aws_db_instance" "default" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7.22"
  instance_class       = "db.t2.micro"
  db_name              = "myrdsdb"
  username             = "dbadmin"
  password             = "dbpassword11"
  parameter_group_name = "default.mysql5.7"
  identifier = "usermgmtdb"
  skip_final_snapshot = true
  db_subnet_group_name   = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.eks-rds-db-sg.id]
}