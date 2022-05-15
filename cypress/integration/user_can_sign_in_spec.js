describe("Sign in", () => {
  it("sends the user to the posts page when signing in", () => {
    cy.visit("/users/new");
    cy.get("#username").type("person2");
    cy.get("#email").type("person2@email.co.uk");
    cy.get("#password").type("password");
    cy.get("#submit").click();

    cy.url().should("eq", "http://localhost:3030/")

    cy.get("#email").type("person2@email.co.uk");
    cy.get("#password").type("password");
    cy.get("#submit").click();

    cy.url().should("contain", "/posts");
  });
});