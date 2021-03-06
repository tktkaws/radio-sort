// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require activestorage
//= require jquery3
//= require rails-ujs
//= require materialize
//= require jquery-ui/widgets/sortable
//= require jquery-ui/effects/effect-highlight
//= require_tree .

// Sidenav
$(document).ready(function(){
    $('.sidenav').sidenav();
    $('#sidenav-1').sidenav({ edge: 'left' });
    $('#sidenav-2').sidenav({ edge: 'right' });
});

$(document).ready(function(){
    $('select').formSelect();
});

$(document).ready(function(){
    $('.tabs').tabs();
});

$(document).ready(function(){
    $('.modal').modal();
});

$(document).ready(function(){
    $('.tooltipped').tooltip({});
});

$(document).ready(function(){
    $(".dropdown-trigger").dropdown({ hover: false, constrainWidth: false });
});

$(document).ready(function(){
    $('.slider').slider({
        indicators: false,
        height: 300,
    });
});