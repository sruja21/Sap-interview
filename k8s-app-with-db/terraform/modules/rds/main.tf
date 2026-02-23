
resource "aws_db_subnet_group" "this" {
  name       = var.name
  subnet_ids = var.private_subnet_ids
}

resource "aws_security_group" "rds_sg" {
  name   = "${var.name}-sg"
  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "allow_from_eks" {
  type                     = "ingress"
  from_port                = 5432
  to_port                  = 5432
  protocol                 = "tcp"
  security_group_id        = aws_security_group.rds_sg.id
  source_security_group_id = var.eks_node_sg
}

resource "random_password" "db" {
  length  = 16
  special = true
}

resource "aws_db_instance" "this" {
  identifier              = var.name
  engine                  = "postgres"
  instance_class          = var.instance_class
  allocated_storage       = 20
  db_subnet_group_name    = aws_db_subnet_group.this.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
  username                = var.db_user
  password                = random_password.db.result
  multi_az                = var.multi_az
  skip_final_snapshot     = true
  publicly_accessible     = false
}
