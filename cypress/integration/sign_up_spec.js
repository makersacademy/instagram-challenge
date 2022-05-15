describe("Registration", () => {
  it("A user signs up and is redirected to posts", () => {
    // sign up
    cy.visit("/users/new");
    cy.get("#email").type("someone2@example.com");
    cy.get("#password").type("password");
    cy.get("#submit").click();

    cy.url().should("include", "/posts");
  });

  it("A user cannot sign up with an email that is already in use", () => {
    // credentials already used in previous test
    cy.visit("/users/new");
    cy.get("#email").type("someone2@example.com");
    cy.get("#password").type("password");
    cy.get("#submit").click();

    cy.contains("Email already in use");
  });
});
