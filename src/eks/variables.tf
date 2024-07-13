variable "labRole" {
  type        = string
  description = "ARN do role do EKS"
}

variable "subnetA" {
  type        = string
  description = "ID da Subnet A"
}

variable "subnetB" {
  type        = string
  description = "ID da Subnet B"
}

variable "subnetC" {
  type        = string
  description = "ID da Subnet C"
}

variable "sgId" {
  type        = string
  description = "ID do Security Group"
}

variable "accessConfig" {
  type        = string
  description = "Modo de autenticação do EKS"
}

variable "arnPrincipal" {
  type        = string
  description = "ARN principal de acesso ao cluster"
}

variable "arnAdmEks" {
  type        = string
  description = "ARN da política administrativa do EKS"
}

variable "nodeName" {
  type        = string
  description = "Nome do grupo de nós"
}

variable "appName" {
  type        = string
  description = "Nome da aplicação"
}

