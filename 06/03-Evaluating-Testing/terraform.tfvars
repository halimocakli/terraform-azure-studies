resource_group_name = "rg-filter"
service_plan_name   = "plan-filter"
environment         = "DEV"


web_apps = {
  webapp1 = {
    "name" = "halimswebapptest1"
    "os"   = "Linux"
  },
  webapp2 = {
    "name" = "halimswebapptest2"
    "os"   = "Linux"
  },
  webapp3 = {
    "name" = "halimswebapptest3"
    "os"   = "Windows"
  }
}

custom_app_settings = {
  CUSTOM_KEY_1 = "CUSTOM_VAL_1"
}
