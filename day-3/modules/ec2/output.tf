output "public-ip-adress" {
    value = aws_instance.test.public_ip
}