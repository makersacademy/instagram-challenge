describe("Comment", () => {
  it("A user can comment on a post", () => {
    cy.visit("/users/new");
    cy.get("#email").type("someone9@example.com");
    cy.get("#password").type("password");
    cy.get("#submit").click();

    // already existing image from previous unit test
    cy.get('div[class="posts"]').first().find(".postimage").click()
    cy.get("#comment").type("heyyy");
    cy.get(".createcomment").click();

    // length 1 to see if the post made in this current test has been deleted
    cy.contains("heyyy");
  });
});
