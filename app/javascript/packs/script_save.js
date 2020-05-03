let scriptPath = window.location.pathname

async function save_script(e) {
    console.log(e)

    let script_title = document.getElementById('script_title').innerHTML
    let script_author = document.getElementById('script_author').innerHTML

    console.log(scriptPath)
    console.log(script_title)
    console.log(script_author)

    $.ajax({
        type: "PUT",
        url: scriptPath,
        data: { title: script_title, author: script_author, save_script: 1 },
        beforeSend: function (xhr) { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
        success: function (data, textStatus, jqXHR) {

            //alert("the file has been saved!")
            console.log("Allan's-script-save-passed")
        },
        error: function (jqXHR, textStatus, errorThrown) { console.log("Allan's-script-save-failed") }
    })
}

var timer = null;
$('#script_title,#script_author').keydown(function () {
    clearTimeout(timer);
    timer = setTimeout(save_script, 1000)
});