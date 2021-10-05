fdescribe('Post', () => {
  const Post = require('../model/posts');
  let postsDatabaseMock;

  beforeEach(() => {
    postsDatabaseMock = jasmine.createSpyObj('postsDatabase', ['all']);
    mockPostsDatabaseCall = [
      {
        id: 103,
        text: 'bbc',
        user_id: 2,
      },
    ];
    postsDatabaseMock.all.and.callFake(() => mockPostsDatabaseCall);
    postClass = new Post(postsDatabaseMock);
  });

  it('should call updateItem method in Item class', async () => {
    const test = await postClass.getPosts();
    expect(test).toEqual([
      {
        id: 103,
        text: 'bbc',
        userID: 2,
      },
    ]);
  });
});
