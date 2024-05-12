resource_group_name = "RG-App"
service_plan_name   = "Plan-App"
environment         = "PROD"

# Map tipli değişkenin liste değerlenin isimleri birbirinden farklı olmalı
web_apps = {
  webapp1 = {
    "name"                = "halimswebapp1"
    "location"            = "westeurope"
    "serverdatabase_name" = "server1"
  },
  webapp2 = {
    "name"                = "halimswebapp2"
    "serverdatabase_name" = "server2"
  }
}
