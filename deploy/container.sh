az containerapp up \
  --resource-group taulant-simple-paas --name tr-webapp-py-container \
  --ingress external --target-port 50505 --source .