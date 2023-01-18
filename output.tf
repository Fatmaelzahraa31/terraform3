 output "public-instance1" {
     description = "public ip 1"
     value       = aws_instance.pinstance1.public_ip
 }


 output "public-instance2" {
     description = "public ip 2"
     value       = aws_instance.pinstance2.public_ip
 }



output "load_balancer_dns_name" {
  value = aws_lb.public-lb1.dns_name
}
