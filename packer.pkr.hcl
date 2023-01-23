#locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

source "amazon-ebs" "Git_Mvn_Nexus" {
  ami_name      = "Git_Mvn_Nexus"
  instance_type = "t2.micro"
  region        = "ap-south-1"
  source_ami    = "ami-0f9d9a251c1a44858"
  ssh_username  = "ec2-user"
}

build {
  sources = ["source.amazon-ebs.Git_Mvn_Nexus"]

  provisioner "shell" {
    inline = ["sudo yum -y update", "sudo yum -y install ansible-core.x86_64"]
  }

  provisioner "ansible-local" {
    playbook_file = "git-maven-install.yaml"
  }

}

