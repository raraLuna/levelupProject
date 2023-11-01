
document.addEventListener("DOMContentLoaded", function(){
    
    
    var gnbEvent = new GnbEvent();
    gnbEvent.init();
    gnbEvent.buttonEvent();

});


function GnbEvent(){

}

GnbEvent.prototype = {
    init : function() {
        console.log('MENU_INFO : ' + MENU_INFO + '  NOWPAGE : ' + NOWPAGE);
        var el = ``;

        for(var i=0; i<MENU_INFO.length; i++){
            el += `
            <div class="header-table-div">
                <a class="header-btn" id="headerBtn_`+(i+1)+`" href="`+MENU_INFO[i].link+`">`
                +MENU_INFO[i].title+
                `</a>
            </div>`;

            if(i != MENU_INFO.length-1) {
                el += `<span class="header-sep"></span>`;
            }
        }

        $('.header-table').append(el);

        if(NOWPAGE == 0) {
            $('.header-left-btn').hide();
            $('.header-left-btn').addClass('right');
            $('.main-container').addClass('all');
            $('.main-side').hide();
            return;
        }

        var info = MENU_INFO[NOWPAGE-1];
        
        //타이틀
        $('.side-title').text(info.title);
        $('.main-title').text(info.branch[SUBPAGE-1].stitle);

        $('#headerBtn_'+NOWPAGE).addClass('active');

        //사이드메뉴
        el = `
        <div class="side-list-box">
            <ul class="side-list">
        `;
        var active = '';

        for(var i=0; i<info.branch.length; i++){
            active = (i == SUBPAGE-1) ? 'active': '';
            el += `
            <li class="side-list-btn depth_`+1+` `+active+`">
                <a href="`+info.branch[i].slink+`" id="sideBtn_`+(i+1)+`">
                    <img src="./resources/images/side-icon-dep`+1+`.png">
                    <span>`+info.branch[i].stitle+`</span>
                </a>
            </li>
            `

            for(var j=0; j<info.branch[i].sbranch.length; j++){
                active = (i == SUBPAGE-1 && j == LNKPAGE-1) ? 'active': '';
                el += `
                <li class="side-list-btn depth_`+2+` `+active+`">
                    <a href="`+info.branch[i].sbranch[j].mlink+`" id="sideSubBtn_`+(i+1)+`_`+(j+1)+`">
                        <img src="./resources/images/side-icon-dep`+2+`.png">
                        <span>`+info.branch[i].sbranch[j].mtitle+`</span>
                    </a>
                </li>
                `
            }
        }

        el += `
            </ul>
        </div>
        `

        $('.side-container').append(el);
    }
    ,
    buttonEvent : function(){
        //헤더의 폴드, 언폴드 버튼
        $('.header-left-btn').on('click', function(){
            var vis = $('.main-side').css('display');
    
            if(vis == 'none') {
                $(this).removeClass('right');
                $('.main-container').removeClass('all');
                $('.main-side').show();
            }else{
                $(this).addClass('right');
                $('.main-container').addClass('all');
                $('.main-side').hide();
            }
        })

        //검색창 나오게 안나오게
        $('#search_visible_btn').on('click', function(){
            var vis = $('.search-form').css('display');

            if(vis == 'none') {
                $(this).removeClass('open');
                $('.search-form').show();
            }else{
                $(this).addClass('open');
                $('.search-form').hide();
            }
        })

        $('.contents-input-btn').on('click', function(){

        })

        $('.contents-input-link').each(function(){
            $(this).on('click', function(){
                $('.modal-pop-area').show();
            })
        })
        

        $('.modal-pop-close').on('click', function(){
            $('.modal-pop-area').hide();
        })

        $('.input-search-btn').each(function(){
            $(this).on('click', function(){
                $('.modal-pop-area').show();
                return false;
            })
        })
    }
}