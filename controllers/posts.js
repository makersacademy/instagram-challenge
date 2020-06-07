var path = require('path');

var PostsController = {
  Index: function(req, res) {
    res.sendFile(path.join(__dirname + '/../public/posts.html'));
    //res.send('hello')
  },
  Create: function(req, res) {
    console.log("yo")
    res.send('Upload successful');
  }
}

module.exports = PostsController;
