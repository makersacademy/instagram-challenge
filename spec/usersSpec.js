// add same tests as Post class
fdescribe('User', () => {
  const User = require('../model/user');
  let usersDatabaseMock;
  let userInstance;

  beforeEach(() => {
    usersDatabaseMock = jasmine.createSpyObj('usersDatabase', [
      'findByUsername',
    ]);
    mockUsersData = [
      {
        id: 2,
        username: 'test',
        password: 'test',
        email: 'test',
        photo_url: null,
      },
    ];
    usersDatabaseMock.findByUsername.and.callFake(() => mockUsersData);
    userInstance = new User(usersDatabaseMock);
  });

  describe('#authenticate', () => {
    it('should call correct method in usersDb with correct argument', async () => {
      await userInstance.authenticate('test', 'test');
      expect(usersDatabaseMock.findByUsername).toHaveBeenCalledWith('test');
    });
    it('should return array with length 1 for authenticated user', async () => {
      const authenticatedUser = await userInstance.authenticate('test', 'test');
      console.log(authenticatedUser);
      expect(authenticatedUser).toEqual({
        id: 2,
        username: 'test',
        email: 'test',
      });
    });

    it('should return false for incorrect username', async () => {
      usersDatabaseMock.findByUsername.and.callFake(() => []);
      const authenticatedUser = await userInstance.authenticate(
        'wrongusername',
        'test'
      );
      expect(authenticatedUser).toEqual(false);
    });

    it('should return false for incorrect passoword', async () => {
      const authenticatedUser = await userInstance.authenticate(
        'test',
        'wring password'
      );
      expect(authenticatedUser).toEqual(false);
    });
  });
});
