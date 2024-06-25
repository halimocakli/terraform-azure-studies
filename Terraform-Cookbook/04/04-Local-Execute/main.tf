terraform {
  required_version = "~> 1.2"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.2"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.1"
    }
  }
}

resource "local_file" "myfile" {
  content  = "This text file created to examine executing local programs with terraform."
  filename = "./example.txt"
}

/*
  It is important to know that the local-exec provisioner, once executed, ensures that the Terraform state file
  cannot be executed a second time by the terraform apply command. To be able to execute the local-exec command
  based on trigger element, such as resource has been modified, it is necessary to add a trigger object inside
  null_resource that will act as the trigger element of the local-exec resource. The following code example code
  uses a trigger, based on timestamp, to execute the local-exec code at each execution step of Terraform. In this
  example, the trigger is a timestamp that will have a different value each time Terraform is run.
*/
resource "null_resource" "readcontentfile" {

  triggers = {
    trigger = timestamp()
  }

  provisioner "local-exec" {
    command = "Get-Content -Path ./example.txt"

    interpreter = ["pwsh", "-Command"]
  }
}
