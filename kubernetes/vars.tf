variable labRole {
  type        = string
  default     = "arn:aws:iam::074153432331:role/LabRole"
  description = "description"
}

variable subnetA {
  type        = string
  default     = "subnet-09009ee96d82980e6"
  description = "description"
}

variable subnetB {
  type        = string
  default     = "subnet-08a498a94132c3a74"
  description = "description"
}

variable subnetC {
  type        = string
  default     = "subnet-002ba8eb135ca1fe1"
  description = "description"
}

variable sgId {
  type        = string
  default     = "sg-0cc642ef6e48abc8a"
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
    default     = "node-fiap-burguer"
    description = ""
}



