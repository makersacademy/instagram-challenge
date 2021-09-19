describe("Create a new photo", () => {
  beforeAll(async () => {
    // The port is 4444 here because it is your test server, not your real one
    await page.goto("http://localhost:4444/users/new");
  });

  it("allows user to add new photo", async () => {
    await expect(page).toFillForm('form[id="form1"]', {
      name: "Edward",
      email: "ed@example.com",
      password: "123456",
    });
    await page.click("#submit");
    await page.waitForNavigation();
    await page.goto("http://localhost:4444/photos/new");
    await expect(page).toMatchElement("title", {
      text: "Add a photo",
    });
    await expect(page).toFillForm('form[id="form1"]', {
      image: "placeholder.jpg",
      text: "A text image",
      userId: "1",
    });
    await page.click("#submit");
    await page.waitForNavigation();
    expect(page.url()).toEqual("http://localhost:4444/photos");
  });
});
