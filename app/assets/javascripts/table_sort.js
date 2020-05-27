$(function(){
    $('#likes_list').sortable({
        update: function(e, ui){
            let item = ui.item;
            let item_data = item.data();
            let params = {_method: 'put'};
            params[item_data.modelName] = { row_order_position: item.index() }
            $.ajax({
                type: 'POST',
                url: item_data.updateUrl,
                dataType: 'json',
                data: params
            });
        },
        stop: function(e, ui){
            $('#likes_list').find('[name="num_data"]').effect('highlight', { color: "#b2dfdb" }, 500)
            $('#likes_list').find('[name="num_data"]').each(function(idx){
                $(this).html(`${idx+1}位`);
            });
        }
    });
});

$(function() {
    Sortable.create($('.list')[0], {
        animation: 150    });
});