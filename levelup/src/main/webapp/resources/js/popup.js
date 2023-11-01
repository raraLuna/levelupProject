

function Popup(){
    
}

Popup.prototype = {
    init : function(type) {

        switch(type) {
            case 'book'://도서검색
                break;
            case 'print'://인쇄소
                break;
        }
        
    }
    ,
    pop_book_1 : function(){
        var el = `
        <!-- modal-pop-box -->
        <div class="modal-pop-box small">
            <div class="modal-pop-title">
                도서검색
                <button class="modal-pop-close">
                    <img src="./resources/images/close.png">
                </button>
            </div>
            
            <!--modal-pop-->
            <div class="modal-pop">
                <div class="modal-pop-search">
                    <div class="select-box">
                        <div class="select-pan">
                            <label for="sel_code"></label>
                            <select name="code" id="sel_code">
                                <option value="name">도서명</option>
                                <option value="code">도서코드</option>
                            </select>
                        </div>
                    </div>
                    <div class="search-box">
                        <button class="search-btn">
                            <img class="search-image" src="./resources/images/search_btn.png">
                        </button>
                        <input type="text" placeholder="키워드를 입력하세요." class="search-box-text" value="">
                    </div>
                </div>

                <div class="modal-pan-center">
                    <table class="contents-table">
                        <thead>
                            <th>
                                No.
                            </th>
                            <th>
                                도서코드
                            </th>
                            <th>
                                도서명
                            </th>
                            <th>
                                재고현황
                            </th>
                        </thead>
                        <tbody>
                            <tr onclick=""  class="cursor-pointer">
                                <td>1</td>
                                <td>10102</td>
                                <td>이것이 자바다</td>
                                <td>140</td>
                            </tr>
                        </tbody>
                        
                    </table>
                </div>

                <!--
                <div class="modal-pan-bottom flex-center">
                    <input type="button" class="contents-input-btn big noline" id="btn_register" value="등록">
                </div>
                -->

            </div>
            <!--modal-pop end-->

        </div>
        <!-- modal-pop-box end-->
        `

        return el;
    }
}