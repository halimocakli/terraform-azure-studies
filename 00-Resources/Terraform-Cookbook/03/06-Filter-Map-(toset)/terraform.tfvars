resource_group_name = "rg-filter"
service_plan_name   = "plan-filter"
environment         = "dev"


web_apps = {
  webapp1 = {
    "name" = "halimwebapptest1"
    "os"   = "Linux"
  },
  webapp2 = {
    "name" = "halimwebapptest2"
    "os"   = "Linux"
  },
  webapp3 = {
    "name" = "halimwebapptest3"
    "os"   = "Windows"
  }
}
