const Post = require("../model/posts");
const util = require("../model/Util");

describe("Post", () => {
  let postsDatabaseMock;
  let dateConverterSpy;
  let mockPostsData;
  let postInstance;
  beforeEach(async () => {
    postsDatabaseMock = jasmine.createSpyObj("postsDatabase", [
      "newPost",
      "all",
      "findById",
    ]);
    mockPostsData = [
      {
        id: 103,
        text: "bbc",
        user_id: 2,
        username: "test",
      },
    ];
    dateConverterSpy = spyOn(util, "convertDateToUKFormat");
    util.convertDateToUKFormat.and.callFake(() => "12/12/2020");
    postsDatabaseMock.newPost.and.callFake(() => mockPostsData.splice(-1));
    postsDatabaseMock.all.and.callFake(() => mockPostsData);
    postsDatabaseMock.findById.and.callFake(() => mockPostsData);
    postInstance = new Post(postsDatabaseMock);
  });

  describe("#addPost", () => {
    it("should call correct method in postsDb with correct arguments", async () => {
      await postInstance.addPost("bbc", 2);
      expect(postsDatabaseMock.newPost).toHaveBeenCalledWith("bbc", 2);
    });

    it("should return array with length 1 based on calling newPost methd in postsDatabase", async () => {
      const newPost = await postInstance.addPost("bbc", 2);
      expect(newPost).toEqual({
        id: 103,
        text: "bbc",
        userID: 2,
      });
    });
  });

  describe("#getPosts", () => {
    it("should call correct methods in postsDb", async () => {
      await postInstance.getPosts();
      expect(dateConverterSpy).toHaveBeenCalled();
      expect(postsDatabaseMock.all).toHaveBeenCalled();
    });
    it("should return array based on calling .all method in postsDatabase", async () => {
      const allPosts = await postInstance.getPosts();
      expect(allPosts).toEqual([
        {
          id: 103,
          text: "bbc",
          userID: 2,
          username: "test",
          createdDate: "12/12/2020",
        },
      ]);
    });
  });

  describe("#getPostById", () => {
    it("should call correct method in postsDb with correct argument", async () => {
      await postInstance.getPostById(2);
      expect(postsDatabaseMock.findById).toHaveBeenCalledWith(2);
    });
    it("should return array with length 1 based on calling findById methd in postsDatabase", async () => {
      const postWithCorrectID = await postInstance.getPostById(2);
      expect(postWithCorrectID).toEqual({
        id: 103,
        text: "bbc",
        userID: 2,
        username: "test",
        createdDate: "12/12/2020",
      });
    });
  });
});
