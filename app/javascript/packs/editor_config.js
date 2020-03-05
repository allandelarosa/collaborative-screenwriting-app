

// const editor = new EditorJS({
//     /**
//     * Id of Element that should contai
//     * dn Editor instance
//     */
//     holder: 'editorjs'
// });

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

function save_file(e) {


    editor.save().then((outputData) => {
        console.log('Article data: ', outputData)
    }).catch((error) => {
        console.log('Saving failed: ', error)
    });
}


document.body.addEventListener('click', function (e) {
    e.preventDefault()
    console.log("im clicking in general")
    var target = e.target || e.srcElement;

    if (target.tagName.toLowerCase() !== 'a') {
        return e;//not clicked on link
    }

    //  console.log(target.id)
    if (target.id == "save_file") {
        return save_file.apply(target, [e]);
    }

}, false);


console.log(editor)
try {
    editor.isReady;
    console.log('Editor.js is ready to worddk!')
    /** Do anything you need after editor initialization */
} catch (reason) {
    console.log(`Editor.js initialization failed because of ${reason}`)
}