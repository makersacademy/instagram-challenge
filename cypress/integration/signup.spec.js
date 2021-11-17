/// <reference types="cypress" />

describe("The Signup Page", () => {
  function createRandomString(length) {
    let result = "";
    const characters =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    const charactersLength = characters.length;
    for (let i = 0; i < length; i++) {
      result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
  }
  beforeEach(() => {
    cy.visit("http://localhost:3000/signup");
  });
  it("sign ups user and logs in when form filled in correctly", () => {
    cy.get("#username").type(createRandomString(5));
    cy.get("#password").type("blahdeblah");
    cy.get("#email").type(`${createRandomString(5)}@${createRandomString(5)}`);
    cy.get("#newUser").submit();
    cy.contains("this is the first post");
  });

  it("notifies user when username already exists", () => {
    cy.get("#username").type("test");
    cy.get("#password").type("blahdeblah");
    cy.get("#email").type("blah@blah.com");
    cy.get("#newUser").submit();
    cy.contains("username already in use");
  });

  it("notifies user when email already exists", () => {
    cy.get("#username").type(createRandomString(8));
    cy.get("#password").type("blahdeblah");
    cy.get("#email").type("test@test");
    cy.get("#newUser").submit();
    cy.contains("email already in use");
  });

  it("notifies user when password is too short", () => {
    cy.get("#username").type(createRandomString(8));
    cy.get("#password").type("2short");
    cy.get("#email").type(`${createRandomString(5)}@${createRandomString(5)}`);
    cy.get("#newUser").submit();
    cy.contains("password needs to be at least 8 characters ");
  });
});
