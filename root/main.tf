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
  rds_sg_name = "rds-sg"
  rds_port = 3306
}

module ec2 {
  source = "../child_modules/ec2"
  pub_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCe6EadwkWg8DmusEPiP/mLz/7eVyJqAaxMfyuKTLCFNJJTqi9xlgYVdmSv7OFA76XyvuhVqrMo9/ClNe+l7jJHuh4ngd7VbRec0r2E8wqQhepPIdCpnE6n5meGlRX4gJSqnObZvRyxR+u1+ffEAV6PwqAjOcKFR0ATm8ONphqsQpDQq1z2S6LRLJLvUbYP/ooDs9MC9ZU6QWlNjoN6IOY0qwZNwYe659TbGb3EfqdeIFhP0CIrEamJzjlk+bStCwW3sgP8V//zWrPy+5JdDHjAewoCXRtV3zZGOCmPahyeUmiXr/q8pZZUtWW7TO8gi5j8da7cz2HEI8XFq/XPVEATVH42f9H7io2Rv2tjHMSCuGYrdJnrZxcfeIUul0jxLMMw4ldgq6giG67clUzreUdEYjpqr//rcysVVQoYxcaklDce6NtlToTG5ocimC8rwGdPm/rB8WhQN9/clreNvuSTl0HSMUrogujk8RI1Q7H6fouLk14H5/Bl7U7Bz7CqPpk= alontrubin@Alons-MacBook-Pro.local"
  key_name = "wordpress"
  ami = "ami-0cf10cdf9fcd62d37"
  instance_type = "t2.micro"
  ec2_tag = "wordpress-ec2"
  security_group = [module.security_groups.sg_id]
  public_subnet_id = module.networking.public_subnet_id
}


