
variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-2"
}

variable "endpoint" {
  description = "Endpoint url"
  type        = string
  default    = "tobais.cf"
}

variable "domain_name" {
  description = "Domain name"
  type        = string
  default     = "tobias.cf"
}
