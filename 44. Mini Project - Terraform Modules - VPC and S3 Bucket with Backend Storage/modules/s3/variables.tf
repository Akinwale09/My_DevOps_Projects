
variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "acl" {
  description = "Access Control List for the bucket"
  type        = string
  default     = "private"
}

