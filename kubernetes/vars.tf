variable labRole {
  type        = string
  default     = "arn:aws:iam::643230847802:role/LabRole"
  description = "description"
}

variable subnetA {
  type        = string
  default     = "subnet-02332486181d5f757"
  description = "description"
}

variable subnetB {
  type        = string
  default     = "subnet-065b86e8bc1297d97"
  description = "description"
}

variable subnetC {
  type        = string
  default     = "subnet-060b3fa08edb4c3f7"
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
    default     = "arn:aws:iam::643230847802:role/voclabs"
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
  description   = "643230847802.dkr.ecr.us-east-1.amazonaws.com/ms-customer"
}

variable uriCluster{
  type    = string
  default = "https://65CF8A33E268928AF31F57B264ABA939.gr7.us-east-1.eks.amazonaws.com"
}

variable caCertificate{
  type    = string
  default = "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURCVENDQWUyZ0F3SUJBZ0lJYTl3cEduUmYrNnN3RFFZSktvWklodmNOQVFFTEJRQXdGVEVUTUJFR0ExVUUKQXhNS2EzVmlaWEp1WlhSbGN6QWVGdzB5TkRBMU1Ua3dNekkwTWpKYUZ3MHpOREExTVRjd016STVNakphTUJVeApFekFSQmdOVkJBTVRDbXQxWW1WeWJtVjBaWE13Z2dFaU1BMEdDU3FHU0liM0RRRUJBUVVBQTRJQkR3QXdnZ0VLCkFvSUJBUUMzRUVJLzlYRlRKdDgvVm5HSCt5cmtGT05yZXc2M2NkSGl2dnhDSzgyQVRJNjNZdE5iVi9zNkgvcUIKQlBSV090N2E3VE9LUjNwOXJUZEhtWk9pWVA0ajhMTlZxbGt3Kys0SzR2MU1LN251bmhqWGFWR1Zka2IzN0NLRApwVDF0TlNwVFRXWUpxdVBzSWptaHZ6Vlk3V1haMEt4WjVpMGI3ell4OVlLWXl0Z1FNYWh3dUZQNjJyNlN4VFQrCjY4dG5JNkNZRHhvSFdBOFc2cVNpbXI1eHNQYU94T3U2ZGlXV1grWVN5VTNGU3VnaVE2UzliZ0NDT0haenhqazkKcHhVWU8yQWs5WEh0Tm04Z0N2THgzV1NWZldFa0NQV1FpZVdmU0NCNGpoaG5WK2NUNDdkNGorQWdUVlluNmJIdAozdmJYZXdRNTNpQms3UytSZGFSS20zMktad3pEQWdNQkFBR2pXVEJYTUE0R0ExVWREd0VCL3dRRUF3SUNwREFQCkJnTlZIUk1CQWY4RUJUQURBUUgvTUIwR0ExVWREZ1FXQkJSSWpLQUg2V2o4ZGU1cTNRSTdMb3lDRWJ3K3p6QVYKQmdOVkhSRUVEakFNZ2dwcmRXSmxjbTVsZEdWek1BMEdDU3FHU0liM0RRRUJDd1VBQTRJQkFRQXJhQ0pJaHR6VAo3dGQzVkd6c1M2cHB3MHVsVVJXU0RDSTlvUjhramR5a2ZWc0YxakFTMnY4bXdSc1E1N0k1TjVmRG1HN0JsZ0ZpCkEydk56WnBIZnl6ck5DZ3NJMVE5dE5QVHBQYnZOb1VKa2xrbEFqaTNnQXFHb0Q2MUZtQ2ZQZjFtQm9Ka3hkRFAKS0Z0S2p1bjdlS1BHRnM3S3BOOHVoQjVpUmU3c0VOS1hHY2s0NU5jbGdudWl3UDhMbC9GQktJOXhsbmJWL2lGeQpQZU4yYXprWDZZdVJOQ0pJT21DQVZ4R3EyUXEzOUhkR2pkZlZLLzQ5Qm50T0c3eWFGSlFPaURHdDZYckFPRGlxCnlpYjBSRGppN0NDODAwRmM3SjFuc3oxc05GcWhkU0FoamZYSWx5MTFJZ1RoSTI3dU4zRGRkT1pJT2lpUWFhTk4KVXNDWlM5QWkrdnYrCi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K"
}



