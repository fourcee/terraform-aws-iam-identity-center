

resource "aws_ssoadmin_permission_set" "permission_set" {
  name             = var.name
  description      = var.description
  instance_arn     = var.identity_center_instance_arn
  session_duration = var.session_duration
}

resource "aws_ssoadmin_permission_set_inline_policy" "policy" {
  count              = var.inline_policy == null ? 0 : 1
  inline_policy      = var.inline_policy
  instance_arn       = var.identity_center_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.permission_set.arn
}

resource "aws_ssoadmin_managed_policy_attachment" "managed_policies" {
  for_each           = toset(var.managed_policy_arns)
  instance_arn       = var.identity_center_instance_arn
  permission_set_arn = aws_ssoadmin_permission_set.permission_set.arn
  managed_policy_arn = each.value
}
