variable "name" {
  type        = string
  description = "Name of the permission set"
}

variable "description" {
  type        = string
  description = "Description of the permission set"
}

variable "identity_center_instance_arn" {
  type        = string
  description = "ARN of the IAM Identity Center instance"
}

variable "session_duration" {
  type        = string
  description = "Session duration in ISO 8601 duration format"
  default     = "PT8H"
}

variable "inline_policy" {
  type        = string
  description = "Inline IAM policy document"
}
