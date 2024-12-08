resource "aws_instance" "web" {
  count = length(var.ava_zone)
  ami           = var.ami_id
  instance_type = var.instance_type
  associate_public_ip_address = "true"
  availability_zone = element(var.ava_zone, count.index)
  vpc_security_group_ids = var.sg_id
  subnet_id = element(var.subnet_id, count.index)
  #var.subnet_id[count.index]
  

  user_data = var.jenkins_install
}
