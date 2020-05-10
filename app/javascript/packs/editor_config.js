
class Heading {
    
  constructor({ data, config, api }) {
    this.api = api;


    this._CSS = {
      block: this.api.styles.block,
      settingsButton: this.api.styles.settingsButton,
      settingsButtonActive: this.api.styles.settingsButtonActive,
      wrapper: 'ff-heading',
    };

    this._settings = config;

    this._data = this.normalizeData(data);

    this.settingsButtons = [];

    this._element = this.getTag();
  }


  normalizeData(data) {
    const newData = {};

    if (typeof data !== 'object') {
      data = {};
    }

    newData.text = data.text || '';
    
    return newData;
  }

  render() {
    return this._element;
  }


  renderSettings() {
    return document.createElement('DIV');
  }    
    
  merge(data) {
    let newData = {
      text: this.data.text + data.text,
    };
    this.data = newData;
  }

  validate(blockData) {
    return blockData.text.trim() !== '';
  }

  save(toolsContent) {
    return {
      text: toolsContent.innerHTML,
    };
  }

  static get conversionConfig() {
    return {
      export: 'text', // use 'text' property for other blocks
      import: 'text' // fill 'text' property from other block's export string
    };
  }

  get data() {
    this._data.text = this._element.innerHTML;

    return this._data;
  }

  set data(data) {
    this._data = this.normalizeData(data);

    if (this._element.parentNode) {

      let newHeader = this.getTag();

      newHeader.innerHTML = this._element.innerHTML;

      this._element.parentNode.replaceChild(newHeader, this._element);

      this._element = newHeader;
    }

    if (data.text !== undefined) {
      this._element.innerHTML = this._data.text || '';
    }
  }

  getTag() {
    let tag = document.createElement('H1');

    tag.innerHTML = this._data.text || '';

    tag.classList.add(this._CSS.wrapper);

    tag.contentEditable = 'true';

    tag.dataset.placeholder = this._settings.placeholder || '';

    return tag;
  }



  onPaste(event) {
    const content = event.detail.data;
      
    this.data = {
      text: content.innerHTML
    };
  }


  static get pasteConfig() {
    return {
      tags: ['H1', 'H2']
    };
  }


  static get toolbox() {
    return {
      icon: '<svg height="15" width="15"><text x="0" y="15" fill="black">H</text>H</svg>',
      title: 'Scene Heading'
    };
  }
}

class Paragraph {
  static get DEFAULT_PLACEHOLDER() {
    return '';
  }

  constructor({data, config, api}) {
    this.api = api;

    this._CSS = {
      block: this.api.styles.block,
      wrapper: 'ce-paragraph'
    };
    this.onKeyUp = this.onKeyUp.bind(this);

    this._placeholder = config.placeholder ? config.placeholder : Paragraph.DEFAULT_PLACEHOLDER;
    this._data = {};
    this._element = this.drawView();

    this.data = data;
  }

  onKeyUp(e) {
    if (e.code !== 'Backspace' && e.code !== 'Delete') {
      return;
    }

    const {textContent} = this._element;

    if (textContent === '') {
      this._element.innerHTML = '';
    }
  }

  drawView() {
    let div = document.createElement('DIV');

    div.classList.add(this._CSS.wrapper, this._CSS.block);
    div.contentEditable = true;
    div.dataset.placeholder = this._placeholder;

    div.addEventListener('keyup', this.onKeyUp);

    return div;
  }

  render() {
    return this._element;
  }

  merge(data) {
    let newData = {
      text : this.data.text + data.text
    };

    this.data = newData;
  }

  validate(savedData) {
    if (savedData.text.trim() === '') {
      return false;
    }

    return true;
  }

  save(toolsContent) {
    return {
      text: toolsContent.innerHTML
    };
  }

  onPaste(event) {
    const data = {
      text: event.detail.data.innerHTML
    };

    this.data = data;
  }

  static get conversionConfig() {
    return {
      export: 'text', // to convert Paragraph to other block, use 'text' property of saved data
      import: 'text' // to covert other block's exported string to Paragraph, fill 'text' property of tool data
    };
  }

  static get sanitize() {
    return {
      text: {
        br: true,
      }
    };
  }

  get data() {
    let text = this._element.innerHTML;

    this._data.text = text;

    return this._data;
  }

  set data(data) {
    this._data = data || {};

    this._element.innerHTML = this._data.text || '';
  }

  static get pasteConfig() {
    return {
      tags: [ 'P' ]
    };
  }

    

    
  static get toolbox() {
    return {
      icon: '<svg height="15" width="15"><text x="0" y="15" fill="black">A</text>H</svg>',
      title: 'Action'
    };
  }
}

class Transition {
  static get DEFAULT_PLACEHOLDER() {
    return '';
  }

  constructor({data, config, api}) {
    this.api = api;

    this._CSS = {
      block: this.api.styles.block,
      wrapper: 'ff-transition'
    };
    this.onKeyUp = this.onKeyUp.bind(this);

    this._placeholder = config.placeholder ? config.placeholder : Paragraph.DEFAULT_PLACEHOLDER;
    this._data = {};
    this._element = this.drawView();

    this.data = data;
  }

  onKeyUp(e) {
    if (e.code !== 'Backspace' && e.code !== 'Delete') {
      return;
    }

    const {textContent} = this._element;

    if (textContent === '') {
      this._element.innerHTML = '';
    }
  }

  drawView() {
    let div = document.createElement('DIV');

    div.classList.add(this._CSS.wrapper, this._CSS.block);
    div.contentEditable = true;
    div.dataset.placeholder = this._placeholder;

    div.addEventListener('keyup', this.onKeyUp);

    return div;
  }

  render() {
    return this._element;
  }

  merge(data) {
    let newData = {
      text : this.data.text + data.text
    };

    this.data = newData;
  }

  validate(savedData) {
    if (savedData.text.trim() === '') {
      return false;
    }

    return true;
  }

  save(toolsContent) {
    return {
      text: toolsContent.innerHTML
    };
  }

  onPaste(event) {
    const data = {
      text: event.detail.data.innerHTML
    };

    this.data = data;
  }

  static get conversionConfig() {
    return {
      export: 'text', // to convert Paragraph to other block, use 'text' property of saved data
      import: 'text' // to covert other block's exported string to Paragraph, fill 'text' property of tool data
    };
  }

  static get sanitize() {
    return {
      text: {
        br: true,
      }
    };
  }

  get data() {
    let text = this._element.innerHTML;

    this._data.text = text;

    return this._data;
  }

  set data(data) {
    this._data = data || {};

    this._element.innerHTML = this._data.text || '';
  }

  static get pasteConfig() {
    return {
      tags: [ 'P' ]
    };
  }

    

    
  static get toolbox() {
    return {
      icon: '<svg height="15" width="15"><text x="0" y="15" fill="black">T</text>H</svg>',
      title: 'Transition'
    };
  }
}

class Character {
  static get DEFAULT_PLACEHOLDER() {
    return '';
  }

  constructor({data, config, api}) {
    this.api = api;

    this._CSS = {
      block: this.api.styles.block,
      wrapper: 'ff-character'
    };
    this.onKeyUp = this.onKeyUp.bind(this);

    this._placeholder = config.placeholder ? config.placeholder : Paragraph.DEFAULT_PLACEHOLDER;
    this._data = {};
    this._element = this.drawView();

    this.data = data;
  }

  onKeyUp(e) {
    if (e.code !== 'Backspace' && e.code !== 'Delete') {
      return;
    }

    const {textContent} = this._element;

    if (textContent === '') {
      this._element.innerHTML = '';
    }
  }

  drawView() {
    let div = document.createElement('DIV');

    div.classList.add(this._CSS.wrapper, this._CSS.block);
    div.contentEditable = true;
    div.dataset.placeholder = this._placeholder;

    div.addEventListener('keyup', this.onKeyUp);

    return div;
  }

  render() {
    return this._element;
  }

  merge(data) {
    let newData = {
      text : this.data.text + data.text
    };

    this.data = newData;
  }

  validate(savedData) {
    if (savedData.text.trim() === '') {
      return false;
    }

    return true;
  }

  save(toolsContent) {
    return {
      text: toolsContent.innerHTML
    };
  }

  onPaste(event) {
    const data = {
      text: event.detail.data.innerHTML
    };

    this.data = data;
  }

  static get conversionConfig() {
    return {
      export: 'text', // to convert Paragraph to other block, use 'text' property of saved data
      import: 'text' // to covert other block's exported string to Paragraph, fill 'text' property of tool data
    };
  }

  static get sanitize() {
    return {
      text: {
        br: true,
      }
    };
  }

  get data() {
    let text = this._element.innerHTML;

    this._data.text = text;

    return this._data;
  }

  set data(data) {
    this._data = data || {};

    this._element.innerHTML = this._data.text || '';
  }

  static get pasteConfig() {
    return {
      tags: [ 'P' ]
    };
  }

  static get toolbox() {
    return {
      icon: '<svg height="15" width="15"><text x="0" y="15" fill="black">C</text>H</svg>',
      title: 'Character'
    };
  }
}

class Dialogue {
  static get DEFAULT_PLACEHOLDER() {
    return '';
  }

  constructor({data, config, api}) {
    this.api = api;

    this._CSS = {
      block: this.api.styles.block,
      wrapper: 'ff-dialogue'
    };
    this.onKeyUp = this.onKeyUp.bind(this);

    this._placeholder = config.placeholder ? config.placeholder : Paragraph.DEFAULT_PLACEHOLDER;
    this._data = {};
    this._element = this.drawView();

    this.data = data;
  }

  onKeyUp(e) {
    if (e.code !== 'Backspace' && e.code !== 'Delete') {
      return;
    }

    const {textContent} = this._element;

    if (textContent === '') {
      this._element.innerHTML = '';
    }
  }

  drawView() {
    let div = document.createElement('DIV');

    div.classList.add(this._CSS.wrapper, this._CSS.block);
    div.contentEditable = true;
    div.dataset.placeholder = this._placeholder;

    div.addEventListener('keyup', this.onKeyUp);

    return div;
  }

  render() {
    return this._element;
  }

  merge(data) {
    let newData = {
      text : this.data.text + data.text
    };

    this.data = newData;
  }

  validate(savedData) {
    if (savedData.text.trim() === '') {
      return false;
    }

    return true;
  }

  save(toolsContent) {
    return {
      text: toolsContent.innerHTML
    };
  }

  onPaste(event) {
    const data = {
      text: event.detail.data.innerHTML
    };

    this.data = data;
  }

  static get conversionConfig() {
    return {
      export: 'text', // to convert Paragraph to other block, use 'text' property of saved data
      import: 'text' // to covert other block's exported string to Paragraph, fill 'text' property of tool data
    };
  }

  static get sanitize() {
    return {
      text: {
        br: true,
      }
    };
  }

  get data() {
    let text = this._element.innerHTML;

    this._data.text = text;

    return this._data;
  }

  set data(data) {
    this._data = data || {};

    this._element.innerHTML = this._data.text || '';
  }

  static get pasteConfig() {
    return {
      tags: [ 'P' ]
    };
  }

  static get toolbox() {
    return {
      icon: '<svg height="15" width="15"><text x="0" y="15" fill="black">D</text>H</svg>',
      title: 'Dialogue'
    };
  }
}


let base = window.location.pathname
// let pathname = window.location.pathname + "/documents/"
// let scriptPath = window.location.pathname

let pathname = base.substring(0, (base.length - "/editor/documents/".length) + 1) + "/documents/"
let scriptPath = base.substring(0, (base.length - "/editor/documents/".length + 1))

console.log(pathname)
console.log(scriptPath)

Date.prototype.formatMMDDYYYY = function () {
    return (this.getMonth() + 1) +
        "/" + this.getDate() +
        "/" + this.getFullYear();
}


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
            success: function (data, textStatus, jqXHR) {
                //if the document saved, updated the script's last_edited


                // POST /script/:id/
                let saved_on = new Date().formatMMDDYYYY()
                let timeInSecs = new Date().getTime()
                $.ajax({
                    type: "PUT",
                    url: scriptPath,
                    data: { last_edited_full: timeInSecs, last_edited: saved_on, from_js: 1 },
                    beforeSend: function (xhr) { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
                    success: function (data, textStatus, jqXHR) {

                        //alert("the file has been saved!")
                        console.log("script-update-passed")
                    },
                    error: function (jqXHR, textStatus, errorThrown) { console.log("script-update-failed") }
                })


                console.log("document-save-passed")
            },
            error: function (jqXHR, textStatus, errorThrown) { console.log("document-save-failed") }
        })
    }).catch((error) => {
        console.log('Saving failed: ', error)
    });
}


// document.getElementById('save_file').addEventListener('click', function (e) {
//     e.preventDefault()
//     save_file()
// })

// document.addEventListener('keypress', save_file);

function logKey(e) {

    console.log('hey re')
}

var timer = null;
$('#editorjs').keydown(function () {
    clearTimeout(timer);
    timer = setTimeout(save_file, 1000)
});

function doStuff() {
    alert('do stuff');
}

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
                    heading: {class: Heading, shortcut: 'CMD+H', inlineToolbae: true},
                    paragraph: {class: Paragraph, shortcut: 'CMD+SHIFT+A', inlineToolbae: true},
                    transition: {class: Transition, shortcut: 'CMD+ALT+T', inlineToolbae: true},
                    character: {class: Character, shortcut: 'CMD+SHIFT+C', inlineToolbae: true},
                    dialogue: {class: Dialogue, shortcut: 'CMD+SHIFT+D', inlineToolbae: true},
                    //parenthetical: {class: Dialogue, shortcut: 'CMD+SHIFT+P', inlineToolbae: true},
                    //subheading: {class: Heading, shortcut: 'CMD+SHIFT+S', inlineToolbae: true}
                },

            });


        } else {
            console.log(data)
            console.log("========")
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
            if (dataobject.blocks) {
                for (let [x, y] of Object.entries(dataobject.blocks)) {
                    console.log(x, y)
                    blocks.push(y)
                }
            }
            console.log(blocks)
            delete dataobject.blocks
            dataobject.blocks = blocks

            editor = new EditorJS({
                holder: 'editorjs',
                tools: {
                    heading: {class: Heading, shortcut: 'CMD+H', inlineToolbae: true},
                    paragraph: {class: Paragraph, shortcut: 'CMD+SHIFT+A', inlineToolbae: true},
                    transition: {class: Transition, shortcut: 'CMD+ALT+T', inlineToolbae: true},
                    character: {class: Character, shortcut: 'CMD+SHIFT+C', inlineToolbae: true},
                    dialogue: {class: Dialogue, shortcut: 'CMD+SHIFT+D', inlineToolbae: true},
                    //parenthetical: {class: Dialogue, shortcut: 'CMD+SHIFT+P', inlineToolbae: true},
                    //subheading: {class: Heading, shortcut: 'CMD+SHIFT+S', inlineToolbae: true}
                },
                data: dataobject

            });

        }




    }
})
