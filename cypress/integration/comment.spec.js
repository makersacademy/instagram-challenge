describe("Comment on post", () => {
  describe("signed in", () => {
    beforeEach(() => {
      cy.visit("http://localhost:3000/login");
      cy.get("#username").type("test");
      cy.get("#password").type("Password");
      cy.get("#loginUser").submit();
      cy.get("#newPostText").type("this is a feature test post");
      cy.get("#newPost").submit();
      cy.contains("View").click();
      cy.get("#newCommentText").type("this is a feature test comment");
      cy.get("#newComment").submit();
    });

    it("shows comment", () => {
      cy.contains("this is a feature test comment");
    });
  });

  describe("not signed in", () => {
    beforeEach(() => {
      cy.visit("http://localhost:3000/");
      cy.contains("View").click();
    });

    it("tells user to sign up or log in, in order to post", () => {
      cy.contains("If you want to leave a comment, sign up or log in :)");
    });
  });
});
