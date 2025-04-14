variable "ec2_key_name" {
  description = "The name of key-pair to access the instance"
  type = string
} 
 
variable "publickey" {
  description = "The public key material"
  type        = string
}  