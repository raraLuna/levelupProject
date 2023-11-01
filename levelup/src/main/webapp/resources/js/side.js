
document.addEventListener("DOMContentLoaded", function(){
    var side = new Side();
	side.init();
});
function Side(){

}

Side.prototype = {
    init : function() {
        var el = ``;
        var info = MENU_INFO[NOWPAGE-1];
        
        //타이틀
        $('.side-title').text(info.title);
        $('.main-title').text(info.branch[SUBPAGE-1].stitle);
        

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

        $('body').append(el);
    }
    
}