# Static IP Address associated with the Bastion host

resource "aws_eip" "bastion_eip" {
  depends_on = [module.vpc, module.ec2-instance_bastion ]
  instance = module.ec2-instance_bastion.id
  vpc      = true
  #tags     = local.common_tags
  tags =    {
    Name = "${local.environment}-bastion-eip"
    owners = local.owners
    environment = local.environment}
}
