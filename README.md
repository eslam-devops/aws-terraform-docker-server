# AWS Terraform Docker Server

مشروع بنية تحتية كاملة باستخدام Terraform و AWS

## 📌 الوصف

المشروع بيعمل Provisioning لـ:
- VPC مع سبنتات عامة وخاصة
- NAT Gateways و IGW
- Bastion Hosts للولوج الآمن
- Auto Scaling Group لعدد 2 Web Servers
- Application Load Balancer
- Security Groups منظمة

الويب سيرفرز بيشتغلوا بجوا Docker  
تم إعداد البيئة لتكون Highly Available و Scalable

## 📁 الهيكل

.
├── data.tf
├── ec2.tf
├── keypair.tf
├── outputs.tf
├── provider.tf
├── security.tf
├── subnet.tf
├── variables.tf
├── vpc.tf


## ⚙️ التقنيات المستخدمة

- AWS (EC2, VPC, ALB, NAT, IGW, etc)
- Terraform
- Docker
- Auto Scaling Group
- Git & GitHub

## 🚀 خطوات التشغيل

```bash
terraform init
terraform plan
terraform apply

🙋‍♂️ صاحب المشروع
Eslam zain
GitHub: eslam-devops
