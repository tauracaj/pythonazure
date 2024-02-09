variable "location" {
  description = "Specifies the location for the resource group and all the resources"
  default     = "northeurope" #"westeurope" #"northeurope"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group where the app service will be created"
  default     = "taulant-simple-paas" 
  type        = string
}
# Tags
variable "tags" {
  type = map
  default = {
    Environment   = "Dev/Test"
    Owner         = "TR"
    CostCenter    = "IT"
    Application   = "python"
    BillingCode   = "MS-0000"
  }
}