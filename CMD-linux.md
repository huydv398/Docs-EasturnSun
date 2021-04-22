# Lệnh Linux
## Kiểm tra thông tin về RAM đang sử dụng

Input:
`cat /proc/meminfo `

Output:


```
|MemTotal: 997956 kB
AnonPages: 67488 kB
CmaFree: 0 kB
MemFree: 690016 kB
Mapped: 24272 kB
HugePages_Total: 0
MemAvailable: 678368 kB
Shmem: 7852 kB
HugePages_Free: 0
Buffers: 2108 kB
Slab: 54280 kB
HugePages_Rsvd: 0
Cached: 106076 kB
SReclaimable: 19156 kB
HugePages_Surp: 0
SwapCached: 0 kB
SUnreclaim: 35124 kB
Hugepagesize: 2048 kB
Active: 96748 kB
KernelStack: 3952 kB
DirectMap4k: 85888 kB
Inactive: 78892 kB
PageTables: 4684 kB
DirectMap2M: 962560 kB
Active(anon): 67960 kB
NFS_Unstable: 0 kB
DirectMap1G: 0 kB
Inactive(anon): 7348 kB|
|Bounce: 0 kB
Active(file): 28788 kB
WritebackTmp: 0 kB
Inactive(file): 71544 kB
CommitLimit: 2596124 kB
Unevictable: 0 kB
Committed_AS: 280140 kB
Mlocked: 0 kB
VmallocTotal: 34359738367 kB
SwapTotal: 2097148 kB
VmallocUsed: 194868 kB
SwapFree: 2097148 kB
VmallocChunk: 34359310332 kB
Dirty: 0 kB
HardwareCorrupted: 0 kB
Writeback: 0 kB
AnonHugePages: 8192 kB
CmaTotal: 0 kB|
```




Kiểm tra phiên bản của Kernel Linux

Input:
cat /proc/version


Output:
Linux version 3.10.0-862.el7.x86_64 (builder@kbuilder.dev.centos.org) (gcc version 4.8.5 20150623 (Red Hat 4.8.5-28) (GCC) ) #1 SMP Fri Apr 20 16:44:24 UTC 2018


Kiểm tra thông tin CPU

Input
cat /proc/cpuinfo

Output:
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

Kiểm tra các thông tin về Kernel

Input:
uname -a

Output:
Linux onedata 3.10.0-862.el7.x86_64 #1 SMP Fri Apr 20 16:44:24 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux

Kiểm tra dung lượng RAM còn trống

Input:
free -m

Output:
                     total        used        free      shared  buff/cache   available
Mem:            974         142         673           7         158         661
Swap:          2047           0        2047

shutdown máy
Init 0

Hiển thị thông tin những file hệ thống, nơi file được lưu hoặc tất cả những file mặc định

df -h


du -sh

Kiểm tra dung lượng thư mục hiện tại

du -h –max-depth=1

Hiển thị dung lượng các thư mục con ở cấp 1 (tại thư mục hiện tại)

fdisk -l

xem và quản lý các phân vùng ổ cứng

Hostname

Xem tên máy

cat /proc/swaps

Kiểm tra thông tin SWAP của máy

w hoặc who

hiện thị thông tin người dùng đã đăng nhập vào hệ thống và tiến trình user đang thực hiện

vmstat

thống kê về sử dụng bộ nhớ

Top -c

để kiểm tra tình trạng sử dụng bộ nhớ và CPU của các tiến trình.

Iotop

kiểm tra hoạt đông io của hệ thống. Xem thêm về các option iotop -h

Ps -A

hiển thị toàn bộ các tiến trình đang chạy trên sever

Lspci

Xem thông tin mainboard

Logout

Kết thúc phiên làm việc hiện tại

Ss

cung cấp thông tin về network/socket kết nối tới máy. Xem them các option: ss -h

passwd

Đổi mật khẩu

wget

Tải các ứng dụng từ một website về

Kill

Dừng proccess (thường dùng khi process bị treo). Chỉ có super-user mới có thể dừng tất cả các tiến trình còn user khác chỉ có thể dừng proccess mà user đó tạo ra.

Uptime

Thể hiện thời gian của hệ thống và tốc độ load trung bình trong khoảng thời gian khoảng 5 – 15 phút

date

Xem ngày, giờ hệ thống

