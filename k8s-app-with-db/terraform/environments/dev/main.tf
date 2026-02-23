
module "rds" {
  source = "../../modules/rds"

  name                = "sap-dev-db"
  vpc_id              = var.vpc_id
  private_subnet_ids  = var.private_subnet_ids
  eks_node_sg         = var.eks_node_sg
  instance_class      = "db.t3.micro"
  db_user             = "appuser"
  multi_az            = false
}
