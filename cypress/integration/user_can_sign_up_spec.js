describe("Registration", () => {
  it("A user signs up", () => {
    // sign up
    cy.visit("/users/new");
    cy.get("#email").type("someone@example.com");
    cy.get("#password").type("password");
    cy.get("#username").type("someone123");
    cy.get("#submit").click();

    cy.url().should("include", "/posts");
  });
});
