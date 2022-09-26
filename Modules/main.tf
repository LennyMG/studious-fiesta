

#### set provider and declares an aws_ami data source with name "ubuntu" #######

provider "aws"{
    region = "us-west-2"
}
data "aws_ami" "ubuntu"
most_recent = true        


###### set filter to select all AMIs with name maching this regex expression ######


filter{
    name = "name"
    values = values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
}

####### canonical ubuuntu AWS account id #####
owners = ["099720109477"]
}


###### Chain Resources Together ######


resource "aws_instance" "helloworld" {
  ami           = data.aws_ami.ubuntu.id 
  instance_type = "t2.micro"
  tags = {
    Name = "HelloWorld"
  }
}