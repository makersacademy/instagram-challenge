var mongoose = require("mongoose");

require("../mongodb_helper");
var Comment = require("../../models/comment");

describe("Comment model", () => {
  beforeEach((done) => {
    mongoose.connection.collections.comments.drop(() => {
      done();
    });
  });

  it("has a message and the number of likes", () => {
    var comment = new Comment({ message: 'hey', user: '627b88582de61f0e5db7f4ca', post: '627b88582de61f0e5db7f4ca' });
    expect(comment.message).toEqual("hey");
    expect(comment.likes).toEqual(0);
  });

  it("can list all comments", (done) => {
    Comment.find((err, comments) => {
      expect(err).toBeNull();
      expect(comments).toEqual([]);
      done();
    });
  });

  it("can save a comment", (done) => {
    var comment = new Comment({ message: 'hey', user: '627b88582de61f0e5db7f4ca', post: '627b88582de61f0e5db7f4ca',});

    comment.save((err) => {
      expect(err).toBeNull();

      Comment.find((err, comments) => {
        expect(err).toBeNull();

        expect(comments[0]).toMatchObject({message: "hey"});
        expect(comments[0].user.toString()).toEqual("627b88582de61f0e5db7f4ca");
        expect(comments[0].post.toString()).toEqual("627b88582de61f0e5db7f4ca");
        done();
      });
    });
  });

  it("comment has the time it was made at", (done) => {
    var comment = new Comment({ message: 'hey', user: '627b88582de61f0e5db7f4ca', post: '627b88582de61f0e5db7f4ca',});

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
