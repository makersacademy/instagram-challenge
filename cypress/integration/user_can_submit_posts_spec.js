describe("Timeline", () => {
  it("can submit posts, when signed in, and view them", () => {
    // sign up
    cy.visit("/users/new");
    cy.get("#username").type("Test");
    cy.get("#email").type("someonetest@example.com");
    cy.get("#password").type("password");
    cy.get("#submit").click();

    // sign in
    cy.visit("/sessions/new");
    cy.get("#email").type("someonetest@example.com");
    cy.get("#password").type("password");
    cy.get("#submit").click();

    // submit a post
    cy.visit("/posts");
    cy.get("#new-post").click();

    cy.get("#url").type("https://imgur.com/eI35OFg");
    cy.get("#caption").type("Im a caption");
    cy.get("#submit").click();

    cy.url().should("include", "/posts");
  });
});
