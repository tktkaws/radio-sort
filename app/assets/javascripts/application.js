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

$(function() {
    Sortable.create($('.list')[0], {
        animation: 150    });
});


document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('select');
    var instances = M.FormSelect.init(elems, options);
});

// Or with jQuery

$(document).ready(function(){
    $('select').formSelect();
});


$(document).ready(function(){
    $('.sidenav').sidenav();
    $('#sidenav-1').sidenav({ edge: 'left' });
    $('#sidenav-2').sidenav({ edge: 'right' });
});


