terraform {
  backend "s3" {
    # These get filled by -backend-config or .tfbackend files
    bucket         = ""  
    key            = ""
    region         = ""
    
    # These are fixed for all environments
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}
