resource aws_kms_key "this" {
    description   = var.description

    customer_master_key_spec = var.key_spec
    key_usage     = var.key_usage

    bypass_policy_lockout_safety_check = var.bypass_policy_lockout_safety_check

    deletion_window_in_days = 10

    ## Automatic key rotation is supported only on symmetric encryption KMS keys.
    enable_key_rotation = (var.key_spec == "SYMMETRIC_DEFAULT") ? var.enable_key_rotation : null
    multi_region        = var.multi_region
    is_enabled          = var.enabled

    policy = data.aws_iam_policy_document.compact.json
    
    tags = var.tags
}

resource aws_kms_alias "this" {
    for_each = { for alias in var.aliases:alias => alias }

    name          = format("alias/%s", each.value)
    target_key_id = aws_kms_key.this.key_id
} 