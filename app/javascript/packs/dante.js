import Dante from 'dante-edito/dante-editor.js'

editor = new Dante.Editor(
      {
        el: "#editor",
        upload_url: "/images.json", //it expect an url string in response like /your/server/image.jpg or http://app.com/images/image.jpg
        store_url: "/save" //post to save

      }
    );
    editor.start()
