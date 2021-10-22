const commentsDatabase = require("../../model/databaseLogic/commentsDatabase");
const { setupTests } = require("./databasehelpers");

describe("commentsDatabase", () => {
  let commentsData;
  let newComment;

  beforeEach(setupTests);

  describe("#getComments", () => {
    beforeEach(async () => {
      commentsData = await commentsDatabase.getComments(1);
    });
    it("returns array of correct length", () => {
      expect(commentsData.length).toEqual(1);
    });

    it("returns object with correct keys", () => {
      expect(Object.keys(commentsData[0])).toContain("id");
      expect(Object.keys(commentsData[0])).toContain("text");
      expect(Object.keys(commentsData[0])).toContain("created_at");
      expect(Object.keys(commentsData[0])).toContain("user_id");
    });
    it("returns correct values in object", () => {
      expect(commentsData[0].text).toEqual("test comment");
      expect(commentsData[0].id).toEqual(1);
      expect(commentsData[0].user_id).toEqual(1);
    });
  });

  describe("#addComment", () => {
    it("returns array of length 1", async () => {
      newComment = await commentsDatabase.addComment(
        "second test comment",
        1,
        1
      );
      expect(newComment.length).toEqual(1);
    });
    it("returns object with correct keys", async () => {
      newComment = await commentsDatabase.addComment(
        "second test comment",
        1,
        1
      );
      expect(Object.keys(newComment[0])).toContain("id");
      expect(Object.keys(newComment[0])).toContain("text");
      expect(Object.keys(newComment[0])).toContain("post_id");
      expect(Object.keys(newComment[0])).toContain("user_id");
    });

    it("returns correct values in object", async () => {
      newComment = await commentsDatabase.addComment(
        "second test comment",
        1,
        1
      );
      expect(newComment[0].text).toEqual("second test comment");
      expect(newComment[0].id).toEqual(2);
      expect(newComment[0].user_id).toEqual(1);
    });
  });
});
