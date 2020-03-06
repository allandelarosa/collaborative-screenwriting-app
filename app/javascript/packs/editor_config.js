

// const editor = new EditorJS({
//     /**
//     * Id of Element that should contai
//     * dn Editor instance
//     */
//     holder: 'editorjs'
// });


// import Rails from 'rails-ujs'
// Rails.start()

const editor = new EditorJS({
    /**
     * Id of Element that should contain the Editor
     */
    holder: 'editorjs',

    /**
     * Available Tools list.
     * Pass Tool's class or Settings object for each Tool you want to use
     */
    tools: {
        header: {
            class: Header,
            inlineToolbar: true
        },
        // ...
    },

    /**
     * Previously saved data that should be rendered
     */
    data: {}
});


function ajax_test() {

    $.ajax({
        type: "POST",
        url: "/documents",
        data: "temp",
        beforeSend: function (xhr) { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
        success: function (data, textStatus, jqXHR) { console.log("yep") },
        error: function (jqXHR, textStatus, errorThrown) { console.log("nope") }
    })

    // $.ajax({
    //     type: "POST",
    //     // beforeSend: function (request) {
    //     //     request.setRequestHeader("Authority", authorizationToken);
    //     // },
    //     url: "/documents",
    //     data: "json=" + escape(JSON.stringify(createRequestObject)),
    //     processData: false,
    //     success: function (msg) {
    //         $("#results").append("The result =" + StringifyPretty(msg));
    //     }
    // });
}

function save_file(e) {
    console.log(e)
    ajax_test()

    // editor.save().then((outputData) => {
    //     console.log('Article data: ', outputData)
    // }).catch((error) => {
    //     console.log('Saving failed: ', error)
    // });
}

document.getElementById('save_file').addEventListener('click', function (e) {
    e.preventDefault()
    save_file()
})


console.log(editor)
