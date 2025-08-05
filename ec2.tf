# السيرفر الرئيسي
resource "aws_instance" "docker_server" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = var.instance_type  # t2.micro مجاني
  subnet_id     = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.docker_sg.id]
  key_name      = aws_key_pair.docker_key.key_name

  # سكربت التهيئة التلقائية
  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install docker -y
              service docker start
              usermod -a -G docker ec2-user
              echo "Docker installed successfully!" > /home/ec2-user/docker-ready.txt
              EOF

  # إعدادات التخزين (8GB فقط - ضمن المجاني)
  root_block_device {
    volume_size = 8  # GB
    volume_type = "gp2"
  }

  tags = {
    Name = "${var.project_name}-instance"
  }

  lifecycle {
    ignore_changes = [instance_state]  # يسمح بإيقاف/تشغيل السيرفر يدوياً
  }
}

# عنوان IP ثابت (اختياري)
resource "aws_eip" "server_ip" {
  instance = aws_instance.docker_server.id
#   vpc      = true
  
  tags = {
    Name = "${var.project_name}-eip"
  }
}