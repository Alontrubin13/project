module networking {
  source = "../child_modules/networking"
  vpc_cidr = "10.0.0.0/16"
  vpc_tag = "wordpress-vpc"
  igw_tag = "wordpress_igw"
  rt_tag = "wordpess-rt"
}

module security_groups {
  source = "../child_modules/security_groups"
  sg_name = "wordpress-sg"
  HTTP = 80
  HTTPS = 443
  SSH = 22
  vpc_id = module.networking.vpc_id
}

