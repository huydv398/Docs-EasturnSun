# Hướng dẫn reset mật khẩu ESXi
Dưới đây là cách dùng để lấy lại khẩu root của ESXi.

Tôi sử dụng môi trường VMware Workstation để miêu tả lại cách reset password.

## Chuẩn bị 
* Ảo hóa
    * VMwave workstation 15. 
    * VMware ESXi 6.5.0
*  Ubuntu Desktop

    * Ở đây tôi sử dụng Ubuntu 18.04.5 LTS (Bionic Beaver)  Link download [tại đây](https://mirrors.bkns.vn/ubuntu-releases/bionic/)

## Thực hiện Reset Password
* Shutdown máy ảo chứa ESXi

![](/image/1.png)

* THÊM boot LiveCD 

![](/image/Screenshot_1.png)


![](/image/Screenshot_2.png)


![](/image/Screenshot_3.png)

* Chon iso mà đã tải ở phần trên về máy

![](/image/Screenshot_4.png)

* F2 thì khởi động để vào được Boot manager, chọn IDE CDROM 0:1


![](/image/Screenshot_5.png)

* Bắt buộc phải chọn dòng `Try ubuntu without installing `

![](/image/Screenshot_6.png)

* Giao diện Ubuntu LiveCD

![](/image/Screenshot_7.png)
## Thực hiện với câu lệnh

Giải thích qua một chút việc cần làm

Trong ESXi có file sau `state.tgz/local.tgz/etc/shadow`. File shadow cũng giống với file shadow của linux, nó dùng để lưu trữ các mã hóa tài khoản root cũng như người dùng.

Mục tiêu là sửa file shadow trong ESXi, bằng cách lấy file mã hóa của Ubuntu liveCD để thay thế.

* lấy mã hóa của mật khẩu mới

`passwd root`

![](/image/Screenshot_8.png)

* Kiểm tra phân vùng

![](/image/Screenshot_9.png)

* Mount phân vùng

![](/image/Screenshot_10.png)

* Tạo một thư mục bên trong `/mnt`

![](/image/Screenshot_11.png)

* Copy file `state.tgz` vào Thư mục vừa tạo

![](/image/Screenshot_12.png)

* Giải nén file `state.tgz` và file `local.tgz`

![](/image/Screenshot_13.png)


![](/image/Screenshot_14.png)

* Mở file `/etc/shadow` để copy chuỗi mã hóa mật khẩu đã lấy lúc đầu

![](/image/Screenshot_15.png)

* Dán chuỗi ký tự trên vào và lưu lại

![](/image/Screenshot_16.png)

* Thực hiện nén lại theo cấu trúc file ban đầu  `state.tgz/local.tgz/etc/shadow`

* `tar -cvzf local.tgz etc/` 
* `tar -cvzf state.tgz local.tgz `


![](/image/Screenshot_17.png)

![](/image/Screenshot_18.png)

* Tại thư mục `/mnt/` xóa file state.tgz

![](/image/Screenshot_19.png)

* copy file `state.tgz` mới xang thư mục `/mnt`

![](/image/Screenshot_20.png)

* Kiểm tra lại

![](/image/Screenshot_21.png)

* `Umount`

![](/image/Screenshot_22.png)

* Xóa iso

![](/image/Screenshot_23.png)

Khởi động và thử mật khẩu mới
