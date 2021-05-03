# ElasticSearch là gì?
ElasticSearch một công cụ tìm kiếm được xây dựng dựa trên Apache lucene. Nó là một mã nguồn mở được phát triển bằng Java. Nó là một công cụ phân tích và phân phối theo thời gian thực giúp thực hiện nhiều loại cơ chế khác nhau. Nó có thể đạt được phản hồi tìm kiếm nhanh chóng vì nó tìm kiếm một chỉ mình thay vì tìm kiếm trực tiếp văn bản. Ngoài ra, nó tìm kiếm toàn văn bản hoàn toàn dựa trên tài liệu thay vì bảng hoặc lược đồ.
## Tại sao lại sử dụng ElasticSearch
* Người dùng có thể thực hiện và kết hợp nhiều loại tìm kiếm khác nhau bất kể loại dữ liệu nào.
* Query có thể được lấy dữ liệu trong bất kỳ hình thức yêu cầu.
* Có thể phân tích hàng tỳ bản ghi trong vài giây.
* Nó cũng cung cấp các tập hợp có thể khám phá các xu hướng và mẫu dữ liệu.
## Ưu điểm của ElasticSearch 
### Khả năng mở rộng
ElasticSearch được xây dụng để mở rộng quy mo. Nó sẽ chạy hoàn toàn tốt trên bất kỳ máy nào hoặc trên một cụm chứa hàng trăm node và trải nghiệm gần như giống nhau. Việc phát triển từ một cụm nhỏ thành một cụm lớn hầu như tự động và không gây sự rối loạn. Việc phát triển từ một cụm lớn đòi hỏi phải lập kế hoạch và thiết kế nhiều hơn một chút, nhưng vẫn tương đối dễ dàng
### Hiệu suất nhanh
ElasticSearch nhanh chóng tìm thấy các kết quả phù hợp nhất cho các kết quả tìm kiếm của bạn
### Đa ngôn ngữ
Đa ngôn ngữ được hỗ trợ trong ElasticSearch
### Định hướng tài liệu
ElasticSearch sử dụng Javascript Object Notation- JSON làm định dạng tuần tự hóa cho tài liệu. JSON được hỗ trợ bởi nhiều ngôn ngữ lập trình khác nhau và đã trở thành định dạng tiêu chuẩn. Nó đơn giản, ngắn gọn và dễ đọc.
### Tự động hoàn thành và tìm kiếm phiên bản
Cung cấp chức năng tự động hoàn thành và tìm kiếm khi bạn nhập. Đây là một tính năng điều hướng để hướng người dùng đến các kết quả có liên quan khi họ đang nhập, cải thiện độ chính xác của tìm kiếm
## Các khái niệm cơ bản
* Near Real Time: ElasticSearch là nền tảng tìm kiếm gần thời gian thực hiện tìm kiếm nhanh
* Cluster: Một cụm là tập hợp một hoặc nhiều node (server) cùng lưu giữ toàn bộ dữ liệu. Nó cung cấp khả năng lập chỉ mục và tìm kiếm liên hợp trên tất cả các node và được xác định bằng một tên duy nhất.
* Node: Là một máy chủ duy nhất là một phần của Cluster, lưu trữ dữ liệu và tham gia vào khả năng lập chỉ mục và tìm kiếm cụm.
* Index-chỉ mục: Là một tập hợp các tài liệu có đặc điểm giống nhau và được xác định bằng tên. Tên này được sử dụng để chỉ mục trong khi thực hiện các tạo tác lập chỉ mục, tìm kiếm, cập nhật và xóa đối với tài liệu trong đó.
* Type: Là một loại logic của một index có ngữ cảnh hoàn chỉnh. Nó được định nghĩa cho các tài liệu có một tập hợp các trường chung. Bạn có thể xác định nhiều type trong một Index.
* Document: Là một đơn vị thông tin cơ bản có được lập chỉ mục. Nó được thể hiển trong JSON, một định dạng trao đổi dữ liệu Internet toàn cầu.
* Shard: cung cấp khả năng chia nhỏ Index thành nhiều phần gọi là shards. Mỗi phân đoạn tự nó là một Index đầy đủ chức năng và độc lập có thể được lưu trữ trên bất kỳ Node nào trong Cluster
* Replicas: Cho phép bạn một hoặc nhiều bản sao của các phân đoạn trong chỉ mục của bạn được gọi là phân đoạn bản sao hoặc bản sao 