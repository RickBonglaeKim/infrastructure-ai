locals {
  prefix = "ai"
}

locals {
  vpc-cidr = "10.111.0.0/16"

  nat_gateway-allocation_id = "eipalloc-0c302e918a4a06b09"

  subnet-database = {
    a = {
      zone = "a"
      name = "ai.database.AZ-a-${var.environment}"
      cidr = "10.111.200.0/26"
    }
    b = {
      zone = "b"
      name = "ai.database.AZ-b-${var.environment}"
      cidr = "10.111.200.64/26"
    }
    c = {
      zone = "c"
      name = "ai.database.AZ-c-${var.environment}"
      cidr = "10.111.200.128/26"
    }
  }

  subnet-private = {
    a = {
      zone = "a"
      name = "ai.private.AZ-a-${var.environment}"
      cidr = "10.111.1.0/24"
    }
    b = {
      zone = "b"
      name = "ai.private.AZ-b-${var.environment}"
      cidr = "10.111.2.0/24"
    }
    c = {
      zone = "c"
      name = "ai.private.AZ-c-${var.environment}"
      cidr = "10.111.3.0/24"
    }
  }

  subnet-public = {
    a = {
      zone = "a"
      name = "ai.public.AZ-a-${var.environment}"
      cidr = "10.111.11.0/24"
    }
    b = {
      zone = "b"
      name = "ai.public.AZ-b-${var.environment}"
      cidr = "10.111.12.0/24"
    }
    c = {
      zone = "c"
      name = "ai.public.AZ-c-${var.environment}"
      cidr = "10.111.13.0/24"
    }
  }

}