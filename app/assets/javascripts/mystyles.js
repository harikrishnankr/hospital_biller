$(document).ready(function(){
    $('#category_select').change(function(){
     $.ajax({
      url: "<%= update_equip_path %>",
      data :{
        category_id: $("#category_select").val()
      },
      dataType: "script"
     });
    });
   $('#equip_select').change(function(){
      $.ajax({
        url:"<%=cost_select_path%>",
        data:{
          equip_id: $('#equip_select').val()
        },
        dataType: "script"
      });
   });
   $('.quantity').change(function(){
      var x=parseFloat($('#unit_price').val());
      var y=parseFloat($(this).val());
      x=x*y;
      $('#total_price').val(parseFloat(x).toFixed(2));
   });
  });