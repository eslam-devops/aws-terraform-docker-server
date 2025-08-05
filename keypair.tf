# مفتاح SSH
resource "aws_key_pair" "docker_key" {
  key_name   = var.key_pair_name
  public_key = file("~/.ssh/docker_aws_key.pub")  # تأكد من وجود الملف
#  resource "aws_key_pair" "docker_key" {
#   key_name   = "docker_new_key"
#   public_key = file("~/.ssh/docker_new_key.pub")


  tags = {
    Name = "${var.project_name}-keypair"
  }
}