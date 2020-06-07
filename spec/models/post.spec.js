var Post = require('../../models/post.js');
var mongoose = require('mongoose');

describe('Post model', function() {
  it('has a filename', function() {
    var post = new Post({ filename: 'some message' });
    expect(post.filename).toEqual('some message');
  })
})
