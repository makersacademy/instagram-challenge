var mongoose = require("mongoose");

require("../mongodb_helper");
var Comment = require("../../models/comment");

describe("Post model", () => {
  beforeEach((done) => {
    mongoose.connection.collections.posts.drop(() => {
      done();
    });
  });

  it("has a message and the user of the commenter and the post id of the post it is replying to", () => {
    var comment = new Comment({ message: 'hey', user: 'bob', post: 'abcdefghi' });
    expect(comment.message).toEqual("hey");
    expect(comment.user).toEqual("bob");
    expect(comment.post).toEqual("abcdefghi");
  });

  it("can list all comments", (done) => {
    Comment.find((err, comments) => {
      expect(err).toBeNull();
      expect(comments).toEqual([]);
      done();
    });
  });

  it("can save a comment", (done) => {
    var comment = new Comment({ message: 'hey', user: 'bob', post: 'abcdefghi',});

    comment.save((err) => {
      expect(err).toBeNull();

      Comment.find((err, comments) => {
        expect(err).toBeNull();

        expect(comments[0]).toMatchObject({message: "hey"});
        expect(comments[0].user.toString()).toEqual("bob");
        done();
      });
    });
  });

  it("comment has the time it was made at", (done) => {
    var comment = new Comment({ message: 'hey', user: 'bob', post: 'abcdefghi',});

    comment.save((err) => {
      expect(err).toBeNull();

      Comment.find((err, comments) => {
        expect(err).toBeNull();

        expect(comments[0].createdAt).toBeDefined();
        done();
      });
    });
  });
})
