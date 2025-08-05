# مجموعة أمان بسيطة
resource "aws_security_group" "docker_sg" {
  name        = "${var.project_name}-sg"
  description = "Allow SSH and Docker ports"
  vpc_id      = aws_vpc.main.id

  # SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
    from_port   = 500
    to_port     = 500
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  # كل الصادر مسموح
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "${var.project_name}-sg"
  }
}