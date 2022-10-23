source "null" "password" {
  communicator = "none"
}

build {
  name = "credencials"

  sources = ["source.null.password"]

  provisioner "shell-local" {
    inline = [
      # Get the password from the secret manager and create a file with its value.
      "echo -n $(secret-tool lookup password ${var.clone_vm}) > ${local.path_password}"
    ]
  }
}
