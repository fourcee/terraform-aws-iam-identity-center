variable "identity_center_instance_arn" {
  type        = string
  description = "ARN of the IAM Identity Center instance"
}

variable "permission_set_arn" {
  type        = string
  description = "ARN of the IAM Identity Center permission set"
}

variable "account_id" {
  type        = string
  description = "AWS account ID"
}

variable "group_names" {
  type        = list(string)
  description = "List of groups to assign to the permission set"
}
