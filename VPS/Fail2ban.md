# Cài đặt Fail2Ban trên centos 7 hạn chế bruteforce
Fail2ban là một chương trình được viết bằng Python. Là một ứng dụng chạy nền theo dõi log file để phát hiện những địa chỉ IP đăng nhập sai password SSH nhiều lần. Sau đó Fail2Ban sử dụng Iptable Firewall Rules để block ngay địa chỉ IP với một khoản thời gian định trước.

## Cài đặt và cấu hình
```
yum install -y epel-release
yum install -y fail2ban

# Sửa file cấu hình

vi /etc/fail2ban/jail.conf

```

Sửa file, chú ý các thông tin như sau:
```
# Tạo file /etc/fail2ban/jail.conf
> /etc/fail2ban/jail.conf

# Chèn nội dung vào file
cat << EOF >> /etc/fail2ban/jail.conf
[DEFAULT]
ignoreip = 127.0.0.1
bantime = 600
findtime = 600
maxretry = 3
EOF
```

Trong đó:
* ignoreip: không block những địa chỉ này
* bantime: khoảng thời gian block mặc định (giây)
*findtime: khoảng thời gian (giây) một IP phải login thành công
* maxretry: số lần login false tối đa

Lưu file cấu hình lại.
## Cấu hình Fail2Ban bảo vệ SSH
Tạo file cấu hình và chèn vào nội dung:

```
cat << EOF >> /etc/fail2ban/jail.local
[sshd]
enabled  = true
filter   = sshd
action   = iptables[name=SSH, port=ssh, protocol=tcp]
logpath  = /var/log/secure
maxretry = 5
bantime = 3600
EOF
```

Trong đó
* **enabled**: Kích hoạt bảo vệ, chuyển thành false sẽ tắt
* **filter**: Giữ mặc định để sử dụng file cấu hình `/etc/fail2ban/filter.d/sshd.conf`
* **action**: fail2ban sẽ ban địa chỉ IP nếu match filter /`etc/fail2ban/action.d/iptables.conf`
* **logpath**: đường dẫn file log fail2ban
* **maxretry**: số lần login false tối đa
* **bantime**: thời gian ban IP 3600 giây = 1 giờ

Khởi động và kích hoạt dịch vụ:

```
systemctl enable fail2ban
systemctl start fail2ban
```

### Thực hiện kiểm tra sau cài đặt.