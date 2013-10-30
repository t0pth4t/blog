// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require BabelSans_500.font.js
//= require cufon-yui.js
//= require jquery.easing.1.3.js
//= require jquery_nested_form
//= require twitter/bootstrap
//= require mediaelement_rails
//= require_tree .

$(function() {
    Cufon.replace('a, span').CSS.ready(function() {
        var $menu       = $("#slidingMenu");

        /**
         * the first item in the menu,
         * which is selected by default
         */
        var $selected   = $menu.find('li:first');

        /**
         * this is the absolute element,
         * that is going to move across the menu items
         * It has the width of the selected item
         * and the top is the distance from the item to the top
         */
        var $moving     = $('<li />',{
            className   : 'move',
            top         : $selected[0].offsetTop + 'px',
            width       : $selected[0].offsetWidth + 'px'
        });

        /**
         * each sliding div (descriptions) will have the same top
         * as the corresponding item in the menu
         */
        $('#slidingMenuDesc > div').each(function(i){
            var $this = $(this);
            $this.css('top',$menu.find('li:nth-child('+parseInt(i+2)+')')[0].offsetTop + 'px');
        });

        /**
         * append the absolute div to the menu;
         * when we mouse out from the menu
         * the absolute div moves to the top (like initially);
         * when hovering the items of the menu, we move it to its position
         */
        $menu.bind('mouseleave',function(){
            moveTo($selected,400);
        })
            .append($moving)
            .find('li')
            .not('.move')
            .bind('mouseenter',function(){
                var $this = $(this);
                var offsetLeft = $this.offset().left - 20;
                //slide in the description
                $('#slidingMenuDesc > div:nth-child('+ parseInt($this.index()) +')').stop(true).animate({'width':offsetLeft+'px'},400, 'easeOutExpo');
                //move the absolute div to this item
                moveTo($this,400);
            })
            .bind('mouseleave',function(){
                var $this = $(this);
                var offsetLeft = $this.offset().left - 20;
                //slide out the description
                $('#slidingMenuDesc > div:nth-child('+ parseInt($this.index()) +')').stop(true).animate({'width':'0px'},400, 'easeOutExpo');
            });;

        /**
         * moves the absolute div,
         * with a certain speed,
         * to the position of $elem
         */
        function moveTo($elem,speed){
            $moving.stop(true).animate({
                top     : $elem[0].offsetTop + 'px',
                width   : $elem[0].offsetWidth + 'px'
            }, speed, 'easeOutExpo');
        }
    }) ;
});