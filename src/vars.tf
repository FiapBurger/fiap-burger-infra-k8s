variable "labRole" {
  type        = string
  default     = "arn:aws:iam::643230847802:role/LabRole"
  description = "ARN do role do EKS"
}

variable "subnetA" {
  type        = string
  default     = "subnet-02332486181d5f757"
  description = "ID da Subnet A"
}

variable "subnetB" {
  type        = string
  default     = "subnet-065b86e8bc1297d97"
  description = "ID da Subnet B"
}

variable "subnetC" {
  type        = string
  default     = "subnet-060b3fa08edb4c3f7"
  description = "ID da Subnet C"
}

variable "sgId" {
  type        = string
  default     = "sg-0234ea9f9c51226c4"
  description = "ID do Security Group"
}


variable "accessConfig" {
  type        = string
  default     = "API_AND_CONFIG_MAP"
  description = "Modo de autenticação do EKS"
}

#variable "arnPrincipal" {
#  type        = string
#  default     = "arn:aws:iam::643230847802:role/voclabs"
#  description = "ARN principal de acesso ao cluster"
#}

variable "arnAdmEks" {
  type        = string
  default     = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  description = "ARN da política administrativa do EKS"
}

variable "nodeName" {
  type        = string
  default     = "node-ms-customer"
  description = "Nome do grupo de nós"
}

variable "appName" {
  type        = string
  default     = "ms-customer-deployment"
  description = "Nome da aplicação"
}
