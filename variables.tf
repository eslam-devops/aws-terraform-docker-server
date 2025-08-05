# المتغيرات العامة
variable "project_name" {
  description = "اسم المشروع"
  type        = string
  default     = "free-docker-server"
}

variable "environment" {
  description = "البيئة (dev, test, prod)"
  type        = string
  default     = "dev"
}

# متغيرات EC2
variable "instance_type" {
  description = "نوع السيرفر (يجب أن يكون t2.micro للمجاني)"
  type        = string
  default     = "t2.micro"
}

variable "key_pair_name" {
  description = "اسم مفتاح SSH"
  type        = string
  default     = "free-docker-key"
}

# قيود الطبقة المجانية
variable "free_tier_limits" {
  description = "قيود الاستخدام المجاني"
  type        = map(number)
  default     = {
    instance_count = 1    # سيرفر واحد فقط
    storage_gb     = 30   # 30GB كحد أقصى
    monthly_hours  = 750  # 750 ساعة شهرياً
  }
}