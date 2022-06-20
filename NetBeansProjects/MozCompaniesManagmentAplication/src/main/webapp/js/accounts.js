$('#sumbimt-btn').click(function(){
    alert();
    var userDetails= {
        fname : $('#user_name').val(),
        email : $('#emailHelp').val(),
        password : $('#exampleInputPassword1').val(),
        gender : $('#gender').val()
       
    };
    $.ajax({
        type: 'POST',
        url: 'register_page.jsp',
        data: {UDETAILS: JSON.stringify(userDetails)},
        success: function(data){
            alert(data);
        }
    });
    return false;
});
