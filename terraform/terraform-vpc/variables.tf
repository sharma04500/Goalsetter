variable "cf_name" {
  description = "Stack name for cloudformation template."
  type        = string
  default     = "goalsetter"
}

variable "stackurl" {
  description = "value"
  type        = string
  default     = "https://s3.us-west-2.amazonaws.com/amazon-eks/cloudformation/2020-10-29/amazon-eks-vpc-sample.yaml"
}

variable "tags" {
  description = "value"
  type        = map(string)
  default = {
    "type" = "POC"
  }
}
