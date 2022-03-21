describe("Add users and update list", () => {
  it("Create and add users", () => {
    cy.visit("/users/new");
    cy.get('[data-cy=input-user]').type("Bob");
    cy.get('[data-cy=submit-user]').click();
    cy.visit("/users/new");
    cy.get('[data-cy=input-user]').type("Sally");
    cy.get('[data-cy=submit-user]').click();
    cy.get('[data-cy=user-list]').should("contain", "Bob");
    cy.get('[data-cy=user-list]').should("contain", "Sally");
  });
});