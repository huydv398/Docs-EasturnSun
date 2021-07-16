
module.exports = {
    title: 'Logo-Tiêu đề Web',// tiêu đề
    path: '/',// Tại đây nó gọi ra file README.md tại thư mục docs
    port: 80,// Port được sử dụng
    description: 'pay to best',
    themeConfig: {
        smoothScroll: true,
        searchPlaceholder: 'Search...', //Chữ nền bên trong ô tìm kiếm

        //Tạo nav
        nav: [
            { text: 'Link', link: 'onedata.vn', target: '_blank' }
        ],
        sidebarDepth: 0, //default: 1, trích dẫn đến h2, =0 vô hiệu hóa liên kết tiêu đề ở sidebar
        //displayAllHeaders: true,
        //activeHeaderLinks: false,
        sidebar: [
            {
                title: 'Sidebar1- Hướng dẫn', //Phần này sẽ được hiện thị ở sidebar
                collapsable: false, //buộc bên trong luôn trích dẫn 
                children: [
                    '/dir/content1', // sẽ gọi ra file content1.md ở thư mục web, tương tự với các content bên dưới
                    '/dir/content2',
                    '/dir/content3',
                    '/dir/content4'
                ]
            },
            {
                //initialOpenGroupIndex: -1,  //Xác định index của nhóm con được mở ban đầu
                title: 'Liên hệ',
                path: '/dir/contact'        
            },
            {
                title: 'Hỗ trợ',
                path: '/dir/support'
            }
        ]
    }
}

