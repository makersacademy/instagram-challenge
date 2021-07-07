var Post = require('../../models/post.js');
var mongoose = require('mongoose');

describe('Post model', function() {
  beforeEach(() => {
    spyOn(Date, 'now').and.returnValue(1592226530185);
  })
  it('has a username', function() {
    var post = new Post({
      userName: 'Eduardo',
      datePosted: Date.now(),
      caption: 'Hello from Cartagena!',
     });
    expect(post.userName).toEqual('Eduardo');
  })
  it('has a date', function() {
    var post = new Post({
      userName: 'Eduardo',
      datePosted: Date.now(),
      caption: 'Hello from Cartagena!',
     });
    expect(post.datePosted.toISOString()).toEqual(new Date(Date.now()).toISOString());
  })
  it('has a username', function() {
    var post = new Post({
      userName: 'Eduardo',
      datePosted: Date.now(),
      caption: 'Hello from Cartagena!',
     });
    expect(post.caption).toEqual('Hello from Cartagena!');
  })
})
