$(document).ready(function(){
    //뒤로가기
    $(".back-arr").click(function(e){
        e.preventDefault();
        window.history.back();
    });
    //헤더스크롤
    var scroll;
    var lastScrollTop = 0;
    var delta = 5;
    var navbarHeight = $('.header, .h-main').outerHeight();

    $(window).scroll(function(event){
        scroll = true;
    });
    setInterval(function(){
        if(scroll){
          hasScrolled();
            scroll = false;
        }
    }, 250);
    function hasScrolled(){
        var st=$(this).scrollTop();
        if(Math.abs(lastScrollTop - st) <= delta) return;

        if (st > lastScrollTop && st > navbarHeight){
            // Scroll Down
            $('.header, .h-main').removeClass('nav-down').addClass('nav-up'); }
        else {
                // Scroll Up
            if(st + $(window).height() < $(document).height()) {
                $('.header, .h-main').removeClass('nav-up').addClass('nav-down');
            }
        }
        lastScrollTop = st;
    }
    //네비,카테고리
    $('#nav-cate').click(function(e){
        e.preventDefault();
        $('.category').addClass('on');
        $('body').attr('style', 'overflow:hidden')
    });
    $('.cate-close, .cate-bg').click(function(e){
        e.preventDefault();
        $('.category').removeClass('on');
        $('body').attr('style', '')
    });
    $('.cateList>li>a, .cateList-2dp>li>a').click(function(e){
        e.preventDefault();
        if($(this).next('ul').css('display') == 'none'){
            $(this).addClass('on');
            $(this).next('ul').slideDown();
        }else{
            $(this).removeClass('on');
            $(this).next('ul').slideUp();
        }  
    });

    $('.filter-a').click(function(e){
        e.preventDefault();
        $('.inner-left').addClass('on');
        $('body').attr('style', 'overflow:hidden')
    });
    $('.cate-close, .cate-bg').click(function(e){
        e.preventDefault();
        $('.inner-left').removeClass('on');
        $('body').attr('style', '')
    });
    $('.inner-filter1>ul>li>a, .out-ul>li>a').click(function(e){
        e.preventDefault();
        if($(this).next('ul').css('display') == 'none'){
            $(this).addClass('on');
            $(this).next('ul').slideDown();
        }else{
            $(this).removeClass('on');
            $(this).next('ul').slideUp();
        }  
    });
});

