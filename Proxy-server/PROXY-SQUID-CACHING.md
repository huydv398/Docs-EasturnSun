# CẤU HÌNH MÁY CHỦ PROXY SQUID CACHING
Squid là một máy chủ proxy lưu trữ nội dung để giảm băng thông và tải các trang web nhanh hơn. Chương trình này mô tả cách thiết lập Squid làm proxu cho giao thức HTTP, HTTPS và FTP cũng như xác thực và hạn chế quyền truy cập.

## Thiết lập Squid làm proxy cache mà không cần xác thực
Quy trình này giới hạn quyền truy cập vào proxy dựa trên các dải IP

1. Cài đặt squid
```
yum install squid
```
2. Chỉnh sửa tệp `/etc/squid/squid.conf`:
1. Định cấu hình loại bộ đệm, đường dẫn đến thư mục bộ đệm, kích thước bộ đệm và các cài đặt khác dành riêng cho loại bộ đệm trong tham số **cache_dir**:
```
cache_dir ufs /var/spool/squid 10000 16 256
```
4. Nếu bạn đặt một thư mục bộ nhớ cache khác với /var/spool/squid/ trong tham số **cache_dir**:
* Tạo thư mục muốn chọn làm cache
```
mkdir -p path_to_cache_directory
```
* Định cấu hình quyền cho thư mục bộ nhớ cache:
```
chown squid:squid path_to_cache_directory
```
5. Nếu bạn chạy SELinux ở chế độ **enforcing**, hãy đặt ngữ cảnh `squid_cache_t` cho thư mục bộ đệm:
```
semanage fcontext -a -t squid_cache_t "path_to_cache_directory(/.*)?"
restorecon -Rv path_to_cache_directory
```
Nếu tiện ích `semanage` không có sẵn trên hệ thống của bạn, hãy cài đặt gói `Policycoreutils-python-utils`.

6. Open the 3128 port in the firewall:
```
firewall-cmd --permanent --add-port=3128/tcp
firewall-cmd --reload
```
7. Enable and start the squid service:
```
systemctl enable --now squid
```
Xác minh
```
curl -O -L "https://www.redhat.com/index.html" -x "192.168.10.128:3128"

```
Nếu `curl` không hiển thị bất kỳ lỗi nào và tệp `index.html` đã được tải xuống thư mục hiện tại, thì proxy sẽ hoạt động.
## Định cấu hình danh sách từ chối miền trong Squid
Thông thường quản trị viên muốn chặn quyền truy cập vào miền cụ thể. Phần này mô tả cách cấu hình danh sách từ chối miền trong Squid
1. Chỉnh sửa tệp `/etc/squid/squid.conf` và thêm các cài đặt sau:
```
acl domain_deny_list dstdomain "/etc/squid/domain_deny_list.txt"
http_access deny all domain_deny_list
```
Thêm các mục này trước câu lệnh `http_access allow` đầu tiên cho phép truy cập vào người dùng hoặc ứng dụng khách.
2. Tạo tệp `/etc/squid/domain_deny_list.txt` và thêm các miền bạn muốn chặn. Ví dụ: để chặn quyền truy cập vào **example.com** bao gồm các tên miền phụ và để chặn **example.net**, hãy thêm:
```
.example.com
example.net
```
Nếu bạn đã tham chiếu đến tệp `/etc/squid/domain_deny_list.txt` trong cấu hình Squid, thì tệp này không được để trống. Nếu tệp trống, Squid không khởi động được.
## Định cấu hình dịch vụ Squid để lắng nghe trên một cổng hoặc địa chỉ IP cụ thể
Theo mặc định, dịch vụ proxy Squid lắng nghe trên cổng 3128 trên tất cả các interfaces. Phần này mô tả các thay đổi cổng và cấu hình Squid để lắng nghe trên một địa chỉ IP cụ thể
1. Edit the /etc/squid/squid.conf file:
* Để đặt cổng mà dịch vụ Squid lắng nghe, hãy đặt số cổng trong tham số http_port. Ví dụ: để đặt cổng thành 8080, hãy đặt:
```
http_port 8080
```
* Để cấu hình địa chỉ IP nào mà dịch vụ Squid lắng nghe, hãy đặt địa chỉ IP và số cổng trong tham số http_port. Ví dụ: để cấu hình Squid chỉ lắng nghe trên địa chỉ IP 192.168.10.1 trên cổng 3128, hãy đặt:
```
http_port 192.168.10.1:3128
```
Thêm nhiều tham số http_port vào tệp cấu hình để định cấu hình Squid lắng nghe trên nhiều cổng và địa chỉ IP:
```
http_port <IP>:3128
http_port <IP>:8080
```
2. Nếu bạn đã định cấu hình Squid sử dụng một cổng khác làm mặc định (3128):
* Open the port in the firewall:
```
firewall-cmd --permanent --add-port=port_number/tcp
firewall-cmd --reload
```
* Nếu bạn chạy SELinux ở chế độ enforcing , hãy gán cổng cho định nghĩa loại cổng `squid_port_t`:
```
semanage port -a -t squid_port_t -p tcp port_number
```
Nếu tiện ích `semanage` không có sẵn trên hệ thống của bạn, hãy cài đặt gói `Policycoreutils-python-utils`.
* Restart the squid service:
```
systemctl restart squid
```
## Tài nguyên bổ sung
Xem tệp `usr/share/doc/squid-<version>/squid.conf.documented` để biết danh sách tất cả các thông số cấu hình mà bạn có thể đặt trong tệp `/etc/squid/squid.conf` cùng với mô tả chi tiết.
1. 
1. 
1. 

