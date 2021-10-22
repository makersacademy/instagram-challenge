describe("Like post", () => {
  beforeEach(() => {
    cy.visit("http://localhost:3000/login");
    cy.get("#username").type("test");
    cy.get("#password").type("test");
    cy.get("#loginUser").submit();
    cy.get("#newPostText").type("this is a feature test post");
    cy.get("#newPost").submit();
    cy.contains("View").click();
    cy.contains("Like").click();
  });

  it("shows comment", () => {
    cy.contains("1 Likes");
  });
});
