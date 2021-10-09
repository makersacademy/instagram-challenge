describe('Comment', () => {
  const Comment = require('../model/comments');
  let commentsDatabaseMock;
  beforeEach(async () => {
    commentsDatabaseMock = jasmine.createSpyObj('commentsDatabase', [
      'addComment',
      'getCommentsByPostId',
    ]);
    mockCommentsData = [
      {
        id: 1,
        text: 'this is a test comment',
        post_id: 1,
        user_id: 1,
      },
    ];
    commentsDatabaseMock.addComment.and.callFake(() => mockCommentsData);
    commentInstance = new Comment(commentsDatabaseMock);
  });

  describe('#addComment', () => {
    it('should call correct method in commentsDb with correct arguments', async () => {
      await commentInstance.addComment('new comment', 1, 1);
      expect(commentsDatabaseMock.addComment).toHaveBeenCalledWith(
        'new comment',
        1,
        1
      );
    });

    it('should return array with length 1 based on calling addComment methd in commentsDatabase', async () => {
      const newComment = await commentInstance.addComment(
        'this is a test comment',
        1,
        1
      );
      expect(newComment).toEqual([
        {
          id: 1,
          text: 'this is a test comment',
          post_id: 1,
          user_id: 1,
        },
      ]);
    });
  });
});
