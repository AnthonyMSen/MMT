// 写入csrf
$.getScript("/static/js/csrftoken.js");

$('.comment-delete').click(function () {
    const tr = $(this).closest("tr");
    const comment_id = $(tr).attr("comment-id");
    $('.ui.tiny.modal.delete')
        .modal({
            closable: true,
            onDeny: function () {
                return true;
            },
            onApprove: function () {

                $.ajax({
                    url: api_comment_delete,
                    data: {
                        'comment_id': comment_id,
                        'csrf_token': csrftoken
                    },
                    type: 'POST',
                    dataType: 'json',
                    success: function (data) {
                        console.log(data);
                        const code = data.code;
                        const msg = data.msg;
                        if (code == 0) {
                            window.location.reload();
                        } else {
                            alert(msg);
                        }
                    },
                    error: function (data) {
                        alert("error" + data)
                    }
                });

            }
        })
        .modal('show');
});


// search
$('#v-search').bind('keypress', function (event) {
    const word = $('#v-search').val();
    if (event.keyCode == "13" && word.length > 0) {
        window.location = search_url + '?q=' + word;
    }
});

$('#search').click(function () {
    const word = $('#v-search').val();
    if (word.length > 0) {
        window.location = search_url + '?q=' + word;
    }
})