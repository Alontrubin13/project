module networking {
  source = "./project/networking"
  vpc_cidr = "10.0.0.0/16"
  vpc_tag = "wordpress-vpc"
  igw_tag = "wordpress_igw"
  rt_tag = "wordpess-rt"
}
