var Post = require('../../models/post.js');

it('has a message', function() {
  var post = new Post('some message');
  expect(post.message).toEqual('some message');
})
