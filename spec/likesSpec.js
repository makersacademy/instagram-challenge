const Like = require("../model/likes");

describe("Like", () => {
  let likesDatabaseMock;
  let mockLikesData;
  let likeInstance;
  beforeEach(async () => {
    likesDatabaseMock = jasmine.createSpyObj("likesDatabase", [
      "addLike",
      "findLikesbyPostId",
    ]);
    mockLikesData = [
      {
        id: 1,
        post_id: 1,
        user_id: 1,
      },
    ];
    likesDatabaseMock.addLike.and.callFake(() => mockLikesData);
    likesDatabaseMock.findLikesbyPostId.and.callFake(() => mockLikesData);
    likeInstance = new Like(likesDatabaseMock);
  });

  describe("#addLike", () => {
    it("should call correct method in likesDb with correct arguments", async () => {
      await likeInstance.addLike(1, 1);
      expect(likesDatabaseMock.addLike).toHaveBeenCalledWith(1, 1);
    });

    it("should return array with length 1 based on calling addLike method in likesDatabase", async () => {
      const newLike = await likeInstance.addLike(1, 1);
      expect(newLike).toEqual([
        {
          id: 1,
          post_id: 1,
          user_id: 1,
        },
      ]);
    });
  });
  describe("#getLikesByPostId", () => {
    it("should call correct method in CommentsDb with correct argument", async () => {
      await likeInstance.getLikesByPostId(1);
      expect(likesDatabaseMock.findLikesbyPostId).toHaveBeenCalledWith(1);
    });
    it("should return array with length 1 based on calling findLikesbyPostId method in likesDatabase", async () => {
      const likes = await likeInstance.getLikesByPostId(1);
      expect(likes).toEqual(1);
    });
  });
});
