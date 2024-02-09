 data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name 
}                                                                   
                                                                            
 resource "azurerm_app_service_plan" "appserviceplan" {                     
   name                = "tr-appserviceplan-py"                           
   location            = data.azurerm_resource_group.resource_group.location   
   resource_group_name = data.azurerm_resource_group.resource_group.name  
   kind = "Linux"                                                           
   reserved = true                                                          
                                                                            
   sku {                                                                    
     tier = "Basic"                                                      
     size = "B1"                                                            
   } 
   tags = var.tags                                                                              
 }                                                                          
                                                                            
 resource "azurerm_app_service" "webapp" {                                  
   name                = "tr-webapp-py"                                   
   location            = data.azurerm_resource_group.resource_group.location    
   resource_group_name = data.azurerm_resource_group.resource_group.name        
   app_service_plan_id = azurerm_app_service_plan.appserviceplan.id         
                                                                            
   site_config {                                                            
     linux_fx_version = "PYTHON|3.10"                                        
   }                                                                        
                                                                            
   app_settings = {                                                         
     "SOME_KEY" = "some-value"                                              
   }  
   tags = var.tags                                                                             
 }     