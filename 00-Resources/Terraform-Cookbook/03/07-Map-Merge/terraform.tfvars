resource_group_name = "RG-App"
service_plan_name   = "Plan-App"
environment         = "PROD"

tags = {
  ENV          = "PROD"
  CODE_PROJECT = "DEMO"
}

custom_app_settings = {
  CUSTOM_KEY_1 = "CUSTOM_VALUE_1"
}
