data "aws_availability_zones" "azs" {
  state = "available"
}
data "aws_vpc" "default" { #terraform data source to get default vpc id
  default = true
}

data "aws_route_table" "default" {
  vpc_id = data.aws_vpc.default.id
    filter {
      name = "association.main"
      values = [ "true"]
    }

}