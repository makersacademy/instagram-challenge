/// <reference types="cypress" />

describe("Posts", () => {
  describe("signed in", () => {
    beforeEach(() => {
      cy.visit("http://localhost:3000/login");
      cy.get("#username").type("test");
      cy.get("#password").type("test");
      cy.get("#loginUser").submit();
    });

    it("shows posts", () => {
      cy.contains("Hello, test");
      cy.contains("this is the first post");
    });

    it("adds post", () => {
      cy.get("#newPostText").type("this is a test post");
      cy.get("#newPost").submit();
      cy.contains("this is a test post");
      cy.contains("test");
    });

    it("shows individual post", () => {
      cy.get("#newPostText").type("this is a feature test post");
      cy.get("#newPost").submit();
      cy.contains("View").click();
      cy.contains("this is a feature test post");
      cy.contains("test");
    });
  });
  describe("not signed in", () => {
    beforeEach(() => {
      cy.visit("http://localhost:3000/");
    });
    it("tells user to sign up or log in, in order to post", () => {
      cy.contains("Welcome! To join the fun, sign up or log in :)");
    });
  });
});
