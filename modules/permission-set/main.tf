

resource "aws_ssoadmin_permission_set" "permission_set" {
  name             = var.name
  description      = var.description
  instance_arn     = var.identity_center_instance_arn
  session_duration = var.session_duration
}

resource "aws_ssoadmin_permission_set_inline_policy" "policy" {
  inline_policy      = var.inline_policy
  instance_arn       = var.identity_center_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.permission_set.arn
}
