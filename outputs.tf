output "instance_public_ip" {
  value       = aws_eip.server_ip.public_ip
  description = "عنوان IP العام للسيرفر"
}

output "ssh_connection_command" {
  value       = "ssh -i ~/.ssh/docker_aws_key ec2-user@${aws_eip.server_ip.public_ip}"
  description = "أمر الاتصال بالسيرفر"
}

output "free_tier_reminder" {
  value = <<EOT
  ✅ تم إنشاء سيرفر مجاني بنجاح!
  
  تذكر:
  1. نوع السيرفر: ${var.instance_type} (مجاني)
  2. المساحة التخزينية: 8GB (من أصل ${var.free_tier_limits["storage_gb"]}GB مجانية)
  3. مدة التشغيل: ${var.free_tier_limits["monthly_hours"]} ساعة شهرياً مجانية
  
  ⚠️ استخدم 'terraform destroy' عند الانتهاء لتجنب الفواتير
  EOT
}