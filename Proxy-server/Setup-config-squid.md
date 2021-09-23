Setup and Configure a Proxy Server – Squid Proxy
## Install Proxy Server: Squid Proxy
Cách tốt nhất để định cấu hình máy chủ proxy là sử dụng proxy Squid. Nó là một máy chủ proxy được sử dụng rộng rãi.

Trong bài viết này, chúng tôi đã đề cập đến những điều sau đây.
* Cài đặt máy chủ proxy 
* Định cấu hình máy chủ proxy 
* Định cấu hình xác thực proxy cơ bản.

Hướng dẫn được thử nghiệm trên CentOS 7.
1. Update the server
```
sudo yum update -y
```
1.  Configure EPEL repo.
```
sudo yum -y install epel-release
sudo yum -y update
sudo yum clean all
```
1. Install squid
```
sudo yum -y install squid
```
1. Start and enable squid server.
```
sudo systemctl start squid
sudo systemctl enable squid
```
1. Check the status of squid server.
```
sudo systemctl status squid
```
## Configure Proxy Server: Squid Proxy
Tất cả các cấu hình cho máy chủ mực đều có trong: `/etc/squid/squid.conf`
### Configure proxy Sources To Access Internet
Trước tiên, bạn cần định cấu hình các nguồn mà từ đó proxy-squid sẽ chấp nhận các kết nối.

Mở `/etc/squid/squid.conffile` và thêm source add vào như hình bên dưới. Thay đổi IP thành mạng/IP mong muốn dựa trên nhu cầu của bạn. Trong ví dụ sau, chúng tôi đã thêm một IP nguồn duy nhất.
1. Update the server
1. Update the server
1. Update the server
1. Update the server
1. Update the server
1. Update the server