variable "cf_name" {
  description = "Stack name for cloudformation template."
  type        = string
  default     = "goalsetter"
}

variable "clustername" {
  description = "Name of the eks cluster."
  type        = string
  default     = "goalcluster"
}

variable "clusterrole" {
  description = "Role Arn for the role attached to the eks cluster."
  type        = string
  default     = "arn:aws:iam::549825371516:role/EKScluster"
}

variable "k8sversion" {
  description = "Default k8s version for the eks cluster."
  type        = number
  default     = 1.28
}

variable "node_group_name" {
  description = "Default name for the node group."
  default     = "goalsgroup"
  type        = string
}

variable "node_role" {
  description = "ARN of the role to be attached to the node group."
  type        = string
  default     = "arn:aws:iam::549825371516:role/node_group_role"
}

variable "instance_type" {
  description = "instance_type to be used for creating the cluster."
  type        = string
  default     = "t3.medium"
}

variable "node_ami" {
  description = "ami_id to be used for creating the node."
  type        = string
  default     = "AL2_x86_64"
}

variable "ec2_ami" {
  description = "ami for ec2 instance"
  type = string
  default = "i-0f64a0886803478fe"
}

variable "tags" {
  description = "value"
  type        = map(string)
  default = {
    "type" = "POC"
  }
}

variable "key_name" {
  description = "key to be used for the ec2 instance."
  type = string
  default = "singapore_key"
}