describe("Comment", () => {
  it("A user can comment on a post", () => {
    cy.visit("/users/new");
    cy.get("#email").type("someone9@example.com");
    cy.get("#password").type("password");
    cy.get("#submit").click();

    // already existing image from previous unit test
    cy.get('div[class="posts"]').first().find(".postimage").click()
    cy.get("#comment").type("heyyy");
    cy.get("#postcomment").click();

    // length 1 to see if the post made in this current test has been deleted
    cy.get(".post").find(".comment").should("contain", "heyyy");
  });
});
