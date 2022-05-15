var mongoose = require("mongoose");

require("../mongodb_helper");
var Post = require("../../models/post");

describe("Post model", () => {
  beforeEach((done) => {
    mongoose.connection.collections.posts.drop(() => {
      done();
    });
  });

  it("has a url", () => {
    var post = new Post({ url: "https://imgur.com/eI35OFg", caption: "Test" });
    expect(post.url).toEqual("https://imgur.com/eI35OFg");
  });

  it("can list all posts", (done) => {
    Post.find((err, posts) => {
      expect(err).toBeNull();
      expect(posts).toEqual([]);
      done();
    });
  });

  it("can save a post", (done) => {
    var post = new Post({ url: "https://imgur.com/eI35OFg", caption: "Test" });

    post.save((err) => {
      expect(err).toBeNull();

      Post.find((err, posts) => {
        expect(err).toBeNull();

        expect(posts[0]).toMatchObject({ caption: "Test" });
        done();
      });
    });
  });
});
