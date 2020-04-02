let pathname = window.location.pathname + "/documents/"


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
//console.log(author)

async function dataObject() {


    editor.save().then((outputData) => {
        console.log('Article data: ', outputData)
        return outputData
    }).catch((error) => {
        console.log('Saving failed: ', error)
        return Object()
    });

}

async function ajax_test() {


    // let outputData = await dataObject()
    let data = await editor.save()
    console.log(data)
    let stringData = JSON.stringify(data)

    $.ajax({
        type: "POST",
        url: pathname,
        data: data,
        beforeSend: function (xhr) { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
        success: function (data, textStatus, jqXHR) { console.log("yep") },
        error: function (jqXHR, textStatus, errorThrown) { console.log("nope") }
    })

    //console.log(editor)


    // editor.save().then((outputData) => {
    //     console.log('Article data: ', outputData)
    // }).catch((error) => {
    //     console.log('Saving failed: ', error)
    // });


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

async function save_file(e) {
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

//get saved document
$.ajax({
    type: "GET",
    url: pathname,
    beforeSend: function (xhr) { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
    error: function (jqXHR, textStatus, errorThrown) { console.log("nope") },
    success: function (data, textStatus, jqXHR) {
        console.log(data)


    }

})
