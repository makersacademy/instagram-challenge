var mongoose = require("mongoose");

require("../mongodb_helper");
var Post = require("../../models/post");

describe("Post model", () => {
  beforeEach((done) => {
    mongoose.connection.collections.posts.drop(() => {
      done();
    });
  });

  it("has a image url", () => {
    var post = new Post({ url: "http://someimg.com" });
    expect(post.url).toEqual("http://someimg.com");
  });

  it("has the number of likes on the post", () => {
    var post = new Post({ url: "http://someimg.com" });
    expect(post.likes).toEqual(0);
  });

  it("has a caption", () => {
    var post = new Post({ url: "http://someimg.com", caption: "this is an image" });
    expect(post.caption).toEqual("this is an image");
  });

  it("can list all posts", (done) => {
    Post.find((err, posts) => {
      expect(err).toBeNull();
      expect(posts).toEqual([]);
      done();
    });
  });

  it("can save a post", (done) => {
    var post = new Post({ user: "627b88582de61f0e5db7f4ca", url: "http://someimg.com",});

    post.save((err) => {
      expect(err).toBeNull();

      Post.find((err, posts) => {
        expect(err).toBeNull();

        expect(posts[0]).toMatchObject({url: "http://someimg.com"});
        expect(posts[0].user.toString()).toEqual("627b88582de61f0e5db7f4ca");
        done();
      });
    });
  });

  it("each post has the time it was made", (done) => {
    var post = new Post({ user: "627b88582de61f0e5db7f4ca", url: "http://someimg.com" })

    post.save((err) => {
      expect(err).toBeNull();
      
      Post.find((err, posts) => {
        expect(err).toBeNull();

        expect(posts[0].createdAt).toBeDefined();
        done();
      });
    });
  });
});
