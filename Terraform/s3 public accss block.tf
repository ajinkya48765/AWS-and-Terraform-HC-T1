resource "aws_s3_bucket_public_access_block" "bk2bk_public" {
    bucket = "bk2bk"
    block_public_acls = false
    block_public_policy = false
}
