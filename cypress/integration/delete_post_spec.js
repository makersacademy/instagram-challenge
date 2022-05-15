describe("Delete", () => {
  it("A user can delete a post made by them", () => {
    cy.visit("/users/new");
    cy.get("#email").type("someone7@example.com");
    cy.get("#password").type("password");
    cy.get("#submit").click();
    cy.get(".newpost").click();
    cy.get("#url").type("https://i.imgur.com/PpUyft2.jpeg");
    cy.get("#caption").type("this is a picture");
    cy.get(".createpost").click();

    // length 2 because in unit test, a post is already created
    cy.get('div[class="posts"]').find('.postimage').should('have.length', 2)

    cy.get('div[class="posts"]').first().find(".postimage").click()
    cy.get('.dltbtn').click();

    cy.url().should("include", "/posts");
    // length 1 to see if the post made in this current test has been deleted
    cy.get('div[class="posts"]').find('.postimage').should('have.length', 1)
  });
});
