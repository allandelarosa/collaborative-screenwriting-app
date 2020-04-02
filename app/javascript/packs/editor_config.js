let pathname = window.location.pathname + "/documents/"


async function ajax_test() {


    // let outputData = await dataObject()
    let data = await editor.save()
    console.log(data)
    let stringData = JSON.stringify(data)
    //console.log(JSON.parse(data.blocks))
    console.log(JSON.stringify(data))
}


async function save_file(e) {
    console.log(e)
    // ajax_test()

    editor.save().then((outputData) => {
        console.log('Article data: ', outputData)
        let transfer = JSON.stringify(outputData)
        console.log(transfer)
        $.ajax({
            type: "POST",
            url: pathname,
            data: { json: outputData },
            beforeSend: function (xhr) { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
            success: function (data, textStatus, jqXHR) { console.log("yep") },
            error: function (jqXHR, textStatus, errorThrown) { console.log("nope") }
        })
    }).catch((error) => {
        console.log('Saving failed: ', error)
    });
}


document.getElementById('save_file').addEventListener('click', function (e) {
    e.preventDefault()
    save_file()
})

let editor;

$.ajax({
    type: "GET",
    url: pathname,
    datatype: 'json',
    beforeSend: function (xhr) { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
    error: function (jqXHR, textStatus, errorThrown) { console.log(errorThrown) },
    success: function (data, textStatus, jqXHR) {
        //console.log(data)
        //console.log(JSON.parse(data.blocks))
        //console.log(data.blocks)
        //editor.data = data
        console.log(data)



        if (data.json == "") {
            console.log(data)
            editor = new EditorJS({
                holder: 'editorjs',
                tools: {
                    header: {
                        class: Header,
                        inlineToolbar: true
                    },
                },

            });


        } else {

            let eData = data
            delete eData.script_id
            delete eData.id
            delete eData.updated_at
            delete eData.created_at
            console.log(eData)
            console.log(data.json)
            let dataobject = Object()
            dataobject = JSON.parse(data.json)
            dataobject.time = parseInt(dataobject.time)
            console.log(dataobject)
            console.log(typeof dataobject)
            console.log(dataobject.blocks)
            let blocks = []
            for (let [x, y] of Object.entries(dataobject.blocks)) {
                console.log(x, y)
                blocks.push(y)
            }
            console.log(blocks)
            delete dataobject.blocks
            dataobject.blocks = blocks

            editor = new EditorJS({
                holder: 'editorjs',
                tools: {
                    header: {
                        class: Header,
                        inlineToolbar: true
                    },
                },
                data: dataobject

            });

        }




    }
})
