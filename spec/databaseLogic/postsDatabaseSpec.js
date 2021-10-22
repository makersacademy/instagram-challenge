const postsDatabase = require("../../model/databaseLogic/postsDatabase");
const { setupTests } = require("./databasehelpers");

describe("postDatabase", () => {
  let postsData;
  let newPost;

  beforeEach(setupTests);

  describe("#all", () => {
    beforeEach(async () => {
      postsData = await postsDatabase.all();
    });
    it("returns array of correct length", async () => {
      expect(postsData.length).toEqual(1);
    });

    it("returns object with correct keys", () => {
      expect(Object.keys(postsData[0])).toContain("id");
      expect(Object.keys(postsData[0])).toContain("text");
      expect(Object.keys(postsData[0])).toContain("created_at");
      expect(Object.keys(postsData[0])).toContain("user_id");
      expect(Object.keys(postsData[0])).toContain("username");
    });
    it("returns correct values in object", () => {
      expect(postsData[0].text).toEqual("test post");
      expect(postsData[0].id).toEqual(1);
      expect(postsData[0].user_id).toEqual(1);
      expect(postsData[0].username).toEqual("test");
    });
  });

  describe("#findById", () => {
    beforeEach(async () => {
      postsData = await postsDatabase.findById(1);
    });
    it("returns array of correct length", () => {
      expect(postsData.length).toEqual(1);
    });
    it("returns object with correct keys", () => {
      expect(Object.keys(postsData[0])).toContain("id");
      expect(Object.keys(postsData[0])).toContain("text");
      expect(Object.keys(postsData[0])).toContain("created_at");
      expect(Object.keys(postsData[0])).toContain("user_id");
      expect(Object.keys(postsData[0])).toContain("username");
    });

    it("returns correct values in object", () => {
      expect(postsData[0].text).toEqual("test post");
      expect(postsData[0].id).toEqual(1);
      expect(postsData[0].user_id).toEqual(1);
      expect(postsData[0].username).toEqual("test");
    });
  });
  describe("#newPost", () => {
    it("returns array of length 1", async () => {
      newPost = await postsDatabase.newPost("second test post", 1);
      expect(newPost.length).toEqual(1);
    });
    it("returns object with correct keys", async () => {
      newPost = await postsDatabase.newPost("second test post", 1);
      expect(Object.keys(newPost[0])).toContain("id");
      expect(Object.keys(newPost[0])).toContain("text");
      expect(Object.keys(newPost[0])).toContain("user_id");
    });

    it("returns correct values in object", async () => {
      newPost = await postsDatabase.newPost("second test post", 1);
      expect(newPost[0].text).toEqual("second test post");
      expect(newPost[0].id).toEqual(2);
      expect(newPost[0].user_id).toEqual(1);
    });
  });
});
