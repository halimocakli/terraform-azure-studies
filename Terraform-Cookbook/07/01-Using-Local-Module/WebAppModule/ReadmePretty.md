

[36mrequirement.terraform[0m (~> 1.1)
[36mrequirement.azurerm[0m (~> 3.23)
[36mrequirement.random[0m (3.5.1)


[36mprovider.azurerm[0m (~> 3.23)
[36mprovider.random[0m (3.5.1)




[36mresource.azurerm_application_insights.appinsight-app (resource)[0m (https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/application_insights)
[36mresource.azurerm_linux_web_app.app (resource)[0m (https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_web_app)
[36mresource.azurerm_service_plan.plan-app (resource)[0m (https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan)
[36mresource.random_string.str (resource)[0m (https://registry.terraform.io/providers/hashicorp/random/3.5.1/docs/resources/string)


[36minput.app_name[0m (required)
[90mName of application[0m

[36minput.location[0m ("West Europe")
[90mLocation of Azure resource[0m

[36minput.operating_system_type[0m ("Linux")
[90mType of the operating system that app deployed0[0m

[36minput.resource_group_name[0m (required)
[90mResource group name[0m

[36minput.service_plan_name[0m (required)
[90mService plan name[0m


[36moutput.webapp_id[0m
[90mn/a[0m

[36moutput.webapp_url[0m
[90mn/a[0m
