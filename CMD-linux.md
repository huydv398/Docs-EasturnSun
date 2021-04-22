# Lệnh Linux
## Kiểm tra thông tin về RAM đang sử dụng

Input:
`cat /proc/meminfo `

Output:

```
MemTotal: 997956 kB
AnonPages: 67488 kB
CmaFree: 0 kB
MemFree: 690016 kB
Mapped: 24272 kB
HugePages_Total: 0
MemAvailable: 678368 kB
...
Cached: 106076 kB
SReclaimable: 19156 kB
HugePages_Surp: 0
SwapCached: 0 kB
SUnreclaim: 35124 kB
Hugepagesize: 2048 kB
Active: 96748 kB
...
Active(anon): 67
SwapTotal: 2097148 kB
VmallocUsed: 194868 kB
SwapFree: 2097148 kB
...
```
## Kiểm tra phiên bản của Kernel Linux

Input:
`cat /proc/version`


Output:
```
Linux version 3.10.0-862.el7.x86_64 (builder@kbuilder.dev.centos.org) (gcc version 4.8.5 20150623 (Red Hat 4.8.5-28) (GCC) ) #1 SMP Fri Apr 20 16:44:24 UTC 2018
```
## Kiểm tra thông tin CPU

Input
`cat /proc/cpuinfo`

Output:
```
processor       : 0
vendor_id       : GenuineIntel
cpu family      : 6
model           : 61
model name      : Intel(R) Core(TM) i5-5300U CPU @ 2.30GHz
stepping        : 4
microcode       : 0x2f
cpu MHz         : 2294.694
cache size      : 3072 KB
physical id     : 0
siblings        : 1
core id         : 0
cpu cores       : 1
apicid          : 0
initial apicid  : 0
fpu             : yes
fpu_exception   : yes
cpuid level     : 20
wp              : yes
flags           : fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush mmx fxsr sse sse2 ss syscall nx pdpe1gb rdtscp lm constant_tsc arch_perfmon nopl xtopology tsc_reliable nonstop_tsc eagerfpu pni pclmulqdq ssse3 fma cx16 pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand hypervisor lahf_lm abm 3dnowprefetch fsgsbase tsc_adjust bmi1 avx2 smep bmi2 invpcid rdseed adx smap xsaveopt ibpb ibrs stibp arat spec_ctrl intel_stibp arch_capabilities
bogomips        : 4589.38
clflush size    : 64
cache_alignment : 64
address sizes   : 43 bits physical, 48 bits virtual
power management:
```
## Kiểm tra các thông tin về Kernel

Input:
`uname -a`

Output:
```
Linux onedata 3.10.0-862.el7.x86_64 #1 SMP Fri Apr 20 16:44:24 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux
```
## Kiểm tra dung lượng RAM còn trống

Input:
`free -m`

Output:
```
                total        used        free      shared  buff/cache   available
Mem:            974         142         673           7         158         661
Swap:          2047           0        2047
```
## shutdown máy
`Init 0`

## Hiển thị thông tin những file hệ thống, nơi file được lưu hoặc tất cả những file mặc định

`df -h`

## Kiểm tra dung lượng thư mục hiện tại
Input:

`du -sh`
## Xem và quản lý các phân vùng ổ cứng
fdisk -l

```
Disk /dev/sda: 21.5 GB, 21474836480 bytes, 41943040 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disk label type: dos
Disk identifier: 0x000be677

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *        2048     2099199     1048576   83  Linux
/dev/sda2         2099200    41943039    19921920   8e  Linux LVM

Disk /dev/mapper/centos-root: 18.2 GB, 18249416704 bytes, 35643392 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes


Disk /dev/mapper/centos-swap: 2147 MB, 2147483648 bytes, 4194304 sectors
Units = sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
```
## Xem tên máy
Input:

`hostname`

Output:
```
[root@onedata ~]# hostname
onedata
```

## Kiểm tra thông tin SWAP của máy
Input:

`cat /proc/swaps`

Output:
```
Filename                                Type            Size    Used    Priority
/dev/dm-1                               partition       2097148 0       -1
```



thống kê về sử dụng bộ nhớ
```
[root@onedata ~]# vmstat
procs -----------memory---------- ---swap-- -----io---- -system-- ------cpu-----
 r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us sy id wa st
 2  0      0 688960   2112 160920    0    0    66    10   63  136  0  1 99  0  0
```
## Kiểm tra tình trạng sử dụng bộ nhớ và CPU của các tiến trình.

`top -c`

## Hiển thị toàn bộ các tiến trình đang chạy trên sever

`ps -A`

## Kết thúc phiên làm việc hiện tại
`Logout`

## Cung cấp thông tin về network/socket kết nối tới máy. Xem them các option: ss -h
`Ss`

## Đổi mật khẩu

`passwd`


## Tải các ứng dụng từ một website về

`wget`

## Dừng proccess (thường dùng khi process bị treo). Chỉ có super-user mới có thể dừng tất cả các tiến trình còn user khác chỉ có thể dừng proccess mà user đó tạo ra.

`Kill`
## Xem ngày, giờ hệ thống

`date`


