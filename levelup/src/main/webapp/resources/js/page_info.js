



const MENU_INFO = [
    {
        title : '업무관리'
        ,link : './work_list.html'
        ,branch : [
            {
                stitle : '공지사항'
                ,slink : './notice_list.html'
                ,sbranch : [
                ]
            },
            {
                stitle : '업무게시판'
                ,slink : './work_list.html'
                ,sbranch : [
                    {mtitle : '개발팀', mlink : './work_list.html'}
                ]
            },
            {
                stitle : '관리자'
                ,slink : ''
                ,sbranch : [
                    {mtitle : '사원등록', mlink : ''},
                    {mtitle : '사원정보수정', mlink : ''},
                    {mtitle : '권한설정', mlink : ''}
                ]
            }
        ]
    }
    ,
    {
        title : '인쇄관리'
        ,link : './print_print_list.html'
        ,branch : [
            {
                stitle : '인쇄의뢰'
                ,slink : './print_print_list.html'
                ,sbranch : [
                    {mtitle : '인쇄의뢰현황', mlink : './print_print_list.html'},
                    {mtitle : '인쇄의뢰등록', mlink : './print_print_input.html'}
                ]
            },
            {
                stitle : '발주관리'
                ,slink : './print_order_list.html'
                ,sbranch : [
                    {mtitle : '발주현황', mlink : './print_order_list.html'},
                    {mtitle : '발주등록', mlink : './print_order_input.html'}
                ]
            },
            {
                stitle : '정산관리'
                ,slink : './print_calc_list.html'
                ,sbranch : [
                    {mtitle : '정산현황', mlink : './print_calc_list.html'},
                    {mtitle : '정산등록', mlink : './print_calc_input.html'}
                ]
            }
        ]
    }
    ,
    {
        title : '출판관리'
        ,link : './pub_contr_list.html'
        ,branch : [
            {
                stitle : '계약관리'
                ,slink : './pub_contr_list.html'
                ,sbranch : [
                    {mtitle : '계약현황', mlink : './pub_contr_list.html'},
                    {mtitle : '계약등록', mlink : './pub_contr_input.html'}
                ]
            },
            {
                stitle : '도서관리'
                ,slink : './pub_book_list.html'
                ,sbranch : [
                    {mtitle : '도서현황', mlink : './pub_book_list.html'},
                    {mtitle : '도서등록', mlink : './pub_book_input.html'}
                ]
            },
            {
                stitle : '편집관리'
                ,slink : './pub_edit_list.html'
                ,sbranch : [
                    {mtitle : '편집현황', mlink : './pub_edit_list.html'},
                    {mtitle : '편집등록', mlink : './pub_edit_input.html'}
                ]
            }
        ]
    },
    {
        title : '재고관리'
        ,link : './inven_store_list.html'
        ,branch : [
            {
                stitle : '입고관리'
                ,slink : './inven_store_list.html'
                ,sbranch : [
                    {mtitle : '입고현황', mlink : './inven_store_list.html'},
                    {mtitle : '입고입력', mlink : './inven_store_input.html'}
                ]
            },
            {
                stitle : '출고관리'
                ,slink : './inven_release_list.html'
                ,sbranch : [
                    {mtitle : '출고현황', mlink : './inven_release_list.html'},
                    {mtitle : '출고등록', mlink : './inven_release_input.html'}
                ]
            },
            {
                stitle : '반품관리'
                ,slink : './inven_return_list.html'
                ,sbranch : [
                    {mtitle : '반품현황', mlink : './inven_return_list.html'},
                    {mtitle : '반품입력', mlink : './inven_return_input.html'}
                ]
            },
            {
                stitle : '재고관리'
                ,slink : './inven_inven_list.html'
                ,sbranch : [
                    {mtitle : '재고현황', mlink : './inven_inven_list.html'}
                ]
            }
        ]
    }
    ,
    {
        title : '영업관리'
        ,link : './sales_order_list.html'
        ,branch : [
            {
                stitle : '주문관리'
                ,slink : './sales_order_list.html'
                ,sbranch : [
                    {mtitle : '주문현황', mlink : './sales_order_list.html'},
                    {mtitle : '주문입력', mlink : './sales_order_input.html'}
                ]
            },
            {
                stitle : '판매관리'
                ,slink : './sales_sales_list.html'
                ,sbranch : [
                    {mtitle : '판매현황', mlink : './sales_sales_list.html'},
                    {mtitle : '판매입력', mlink : './sales_sales_input.html'}
                ]
            },
            {
                stitle : '거래처'
                ,slink : './sales_acount_list.html'
                ,sbranch : [
                    {mtitle : '거래처현황', mlink : './sales_acount_list.html'},
                    {mtitle : '거래처등록', mlink : './sales_acount_input.html'}
                ]
            },
            {
                stitle : '매출관리'
                ,slink : './sales_income_list.html'
                ,sbranch : [
                    {mtitle : '매출통계', mlink : './sales_income_list.html'},
                    {mtitle : '도서트렌드분석', mlink : './sales_trend_list.html'}
                ]
            }
        ]
    }
    ,
    {
        title : '전자결재'
        ,link : './apr_sel.html'
        ,branch : [
            {
                stitle : '내결재관리'
                ,slink : './apr_sel.html'
                ,sbranch : [
                ]
            },
            {
                stitle : '기안서통합관리'
                ,slink : './apr_sel_all.html'
                ,sbranch : [
                ]
            },
            {
                stitle : '기안서작성'
                ,slink : './apr_input.html'
                ,sbranch : [
                ]
            },
            {
                stitle : '결재라인'
                ,slink : './apr_line.html'
                ,sbranch : [
                ]
            }
        ]
    }
]