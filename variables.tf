variable "AWS_ACCESS_KEY" {
  
}

variable "AWS_SECRET_KEY" {
  
}

variable "AWS_SESSION_TOKEN" {
  
}

variable "AWS_REGION" {
  default = "us-east-1"
}
variable "Security_Group" {
  type = "list"
  default = ["sg-24076","sg-35214","sg-96824587"]
  
}