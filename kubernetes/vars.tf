variable labRole {
  type        = string
  default     = "arn:aws:iam::074153432331:role/LabRole"
  description = "description"
}

variable subnetA {
  type        = string
  default     = "subnet-09faa5335b7ba858c"
  description = "description"
}

variable subnetB {
  type        = string
  default     = "subnet-0101ea48b8a39b120"
  description = "description"
}

variable subnetC {
  type        = string
  default     = "subnet-03ca5901ecfe029c1"
  description = "description"
}

variable sgId {
  type        = string
  default     = "sg-0f4a1e33d981dc80c"
  description = "description"
}

variable accessConfig {
  type        = string
  default     = "API_AND_CONFIG_MAP"
  description = "description"
}

variable arnPrincipal {
    type        = string
    default     = "arn:aws:iam::074153432331:role/voclabs"
    description = "arn principal de acesso ao cluster"
}

variable arnAdmEks {
    type        = string
    default     = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
    description = "arn admin de acesso ao cluster"
}

variable nodeName {
    type        = string
    default     = "node-ms-customer"
    description = ""
}

variable appName {
  type        = string
  default     = "ms-customer-deployment"
  description = "nome da aplicacao"
}

variable uriECRImage{
  type          = string
  default       = "uri da imagem da aplicacao"
  description   = "074153432331.dkr.ecr.us-east-1.amazonaws.com/ms-customer"
}



