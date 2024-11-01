data "aws_identitystore_group" "groups" {
  for_each          = toset(var.group_names)
  identity_store_id = var.identity_center_instance_arn

  alternate_identifier {
    unique_attribute {
      attribute_path  = "DisplayName"
      attribute_value = each.value
    }
  }
}

resource "aws_ssoadmin_account_assignment" "assignment" {
  for_each           = toset(var.group_names)
  instance_arn       = var.identity_center_instance_arn
  permission_set_arn = var.permission_set_arn

  principal_id   = data.aws_identitystore_group.groups[each.value].group_id
  principal_type = "GROUP"

  target_id   = var.account_id
  target_type = "AWS_ACCOUNT"
}
