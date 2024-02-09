 data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name 
}                                                                   
                                                                            
 resource "azurerm_app_service_plan" "appserviceplan" {                     
   name                = "tr-appserviceplan-py2"                           
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
   name                = "tr-webapp-py2"                                   
   location            = data.azurerm_resource_group.resource_group.location    
   resource_group_name = data.azurerm_resource_group.resource_group.name        
   app_service_plan_id = azurerm_app_service_plan.appserviceplan.id         
                                                                            
   site_config {                                                            
        app_command_line = ""
        linux_fx_version = "DOCKER|tracaj/flask:latest"
        always_on        = true                                        
   }                                                                        
                                                                            
   app_settings = {                                                         
      "DOCKER_REGISTRY_SERVER_PASSWORD"           = "value"
      "DOCKER_REGISTRY_SERVER_URL"                = "value"
      "DOCKER_REGISTRY_SERVER_USERNAME"           = "value"                                           
   }  
   tags = var.tags                                                                             
 }     