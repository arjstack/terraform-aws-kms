# ARJ-Stack: AWS Key Management Service Terraform module

A Terraform module for configuring KMS Keys

## Resources
This module features the following components to be provisioned with different combinations:

- KMS Key [[aws_kms_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key)]
- KMS Key Aliases [[aws_kms_alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias)]

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.22.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.22.0 |

## Examples

Refer [Configuration Examples](https://github.com/arjstack/terraform-aws-examples/tree/main/aws-kms) for effectively utilizing this module.

## Inputs

- Refer the KMS Policy Reference: https://docs.aws.amazon.com/kms/latest/developerguide/key-policy-default.html for the following properties:
    - `key_administrators`
    - `key_grants_users`
    - `key_symmetric_encryption_users`
    - `key_symmetric_hmac_users`
    - `key_asymmetric_public_encryption_users`
    - `key_asymmetric_sign_verify_users`

- Reference values for `key_spec`:
    - [Key Type: Symmetric, Key Usage: Encrypt and decrypt]
        - `SYMMETRIC_DEFAULT`
    - [Key Type: Symmetric, Key Usage: Generate and verify MAC]
        - `HMAC_224`, `HMAC_256`, `HMAC_384`, `HMAC_512`
    - [Key Type: Asymmetric, Key Usage: Encrypt and decrypt]
        - `RSA_2048`, `RSA_3072`, `RSA_4096`
    - [Key Type: Asymmetric, Key Usage: Sign and verify]
        - `RSA_2048`, `RSA_3072`, `RSA_4096`, `ECC_NIST_P256`, `ECC_NIST_P384`, `ECC_NIST_P521`,  `ECC_SECG_P256K1`.


| Name | Description | Type | Default | Required |
|:------|:------|:------|:------|:------:|
| <a name="account_id"></a> [account_id](#input\_account\_id) | Account ID where KMS key is being created | `string` |  | yes |
| <a name="description"></a> [description](#input\_description) | The description of the key as viewed in AWS console. | `string` | `null` | no |
| <a name="key_spec"></a> [key_spec](#input\_key\_spec) | Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. | `string` | `"SYMMETRIC_DEFAULT"` | no |
| <a name="key_usage"></a> [key_usage](#input\_key\_usage) | Specifies the intended use of the key. | `string` | `"ENCRYPT_DECRYPT"` | no |
| <a name="custom_key_store_id"></a> [custom_key_store_id](#input\_custom\_key\_store\_id) | ID of the KMS Custom Key Store where the key will be stored instead of KMS (eg CloudHSM). | `string` | `null` | no |
| <a name="aliases"></a> [aliases](#input\_aliases) | List of the aliases. | `(string)` | `[]` | no |
| <a name="bypass_policy_lockout_safety_check"></a> [bypass_policy_lockout_safety_check](#input\_bypass\_policy\_lockout\_safety\_check) | Flag to decide if the key policy lockout safety check should be bypassed. | `bool` | `false` | no |
| <a name="deletion_window_in_days"></a> [deletion_window_in_days](#input\_deletion\_window\_in\_days) | The waiting period, specified in number of days. After the waiting period ends, AWS KMS deletes the KMS key. | `number` | `30` | no |
| <a name="enable_key_rotation"></a> [enable_key_rotation](#input\_enable\_key\_rotation) | Flag to decide if KMS key rotation is enabled | `bool` | `false` | no |
| <a name="multi_region"></a> [multi_region](#input\_multi\_region) | Flag to decide if KMS key is multi-region or regional. | `bool` | `false` | no |
| <a name="key_administrators"></a> [key_administrators](#input\_key\_administrators) | Flag to decide if KMS key is enabled. | `list(string)` | `[]` | no |
| <a name="key_grants_users"></a> [key_grants_users](#input\_key\_grants\_users) | Account ID where KMS key is being created | `list(string)` | `[]` | no |
| <a name="key_symmetric_encryption_users"></a> [key_symmetric_encryption_users](#input\_key\_symmetric\_encryption\_users) | List of ARNs for IAM principals that would be allowed to use the symmetric KMS key directly for all supported cryptographic operations | `list(string)` | `[]` | no |
| <a name="key_symmetric_hmac_users"></a> [key_symmetric_hmac_users](#input\_key\_symmetric\_hmac\_users) | List of ARNs for IAM principals that would be allowed to use the symmetric HMAC keys | `list(string)` | `[]` | no |
| <a name="key_asymmetric_public_encryption_users"></a> [key_asymmetric_public_encryption_users](#input\_key\_asymmetric\_public\_encryption\_users) | List of ARNs for IAM principals that would be allowed to use the asymmetric KMS key for Encrypt and decrypt. | `list(string)` | `[]` | no |
| <a name="key_asymmetric_sign_verify_users"></a> [key_asymmetric_sign_verify_users](#input\_key\_asymmetric\_sign\_verify\_users) | List of ARNs for IAM principals that would be allowed to use the asymmetric KMS key directly for Sign and Verify. | `list(string)` | `[]` | no |
| <a name="tags"></a> [tags](#input\_tags) | A map of tags to assign to the KMS key. | `map` | `{}` | no |

## Outputs

| Name | Type | Description |
|:------|:------|:------|
| <a name="key_id"></a> [key_id](#output\_key\_id) | `string` | The globally unique identifier for the key |
| <a name="key_arn"></a> [key_arn](#output\_key\_arn) | `string` | The Amazon Resource Name (ARN) of the key |
| <a name="key_policy"></a> [key_policy](#output\_key\_policy) | `string` | The KMS Key Policy |

## Authors

Module is maintained by [Ankit Jain](https://github.com/ankit-jn) with help from [these professional](https://github.com/arjstack/terraform-aws-kms/graphs/contributors).
