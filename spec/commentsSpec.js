/* eslint-disable comma-dangle */
const Comment = require("../model/comments");
const util = require("../model/Util");

describe("Comment", () => {
  let commentsDatabaseMock;
  let mockCommentsData;
  let commentInstance;
  beforeEach(async () => {
    commentsDatabaseMock = jasmine.createSpyObj("commentsDatabase", [
      "addComment",
      "getComments",
    ]);
    mockCommentsData = [
      {
        id: 1,
        text: "this is a test comment",
        post_id: 1,
        user_id: 1,
      },
    ];
    dateConverterSpy = spyOn(util, "convertDateToUKFormat");
    util.convertDateToUKFormat.and.callFake(() => "12/12/2020");
    commentsDatabaseMock.addComment.and.callFake(() => mockCommentsData);
    commentsDatabaseMock.getComments.and.callFake(() => mockCommentsData);
    commentInstance = new Comment(commentsDatabaseMock);
  });

  describe("#addComment", () => {
    it("should call correct method in commentsDb with correct arguments", async () => {
      await commentInstance.addComment("new comment", 1, 1);
      expect(commentsDatabaseMock.addComment).toHaveBeenCalledWith(
        "new comment",
        1,
        1
      );
    });

    it("should return array with length 1 based on calling addComment methd in commentsDatabase", async () => {
      const newComment = await commentInstance.addComment(
        "this is a test comment",
        1,
        1
      );
      expect(newComment).toEqual([
        {
          id: 1,
          text: "this is a test comment",
          post_id: 1,
          user_id: 1,
        },
      ]);
    });
  });
  describe("#getCommentsByPostId", () => {
    it("should call correct method in CommentsDb with correct argument", async () => {
      await commentInstance.getCommentsByPostId(1);
      expect(commentsDatabaseMock.getComments).toHaveBeenCalledWith(1);
    });
    it("should return array with length 1 based on calling getComments method in commentsDatabase", async () => {
      const comments = await commentInstance.getCommentsByPostId(1);
      expect(comments).toEqual([
        {
          id: 1,
          text: "this is a test comment",
          userID: 1,
          postID: 1,
          createdDate: "12/12/2020",
        },
      ]);
    });
  });
});
