resource "aws_instance" "ec2-tf" {
  ami               = var.ami
  instance_type     = var.chassis
  key_name          = var.key
  security_groups   = [var.sg-id]
  count             = var.num_of_ec2
  subnet_id         = var.subnet[count.index]
  tags              = { Name = "ec2-tf-${count.index}" }
  user_data         = file("user-data.sh")

}

output "instance_ids" {
  value = aws_instance.ec2-tf[*].id
}