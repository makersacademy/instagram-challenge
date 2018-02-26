# Instagrat!

Welcome to Instagrat, a clone of instagram. This is a rails app, completed over a day, to solidify my understanding of rails.

This app uses devise to handle user log in and paperclip for image uploads. In its current state image uploads are limited and local only, this app would take a small amount of work to function in a deployment environment. All rails and devise commands were "long", in that I did not use scaffolding. I did this both to reduce clutter but also to increase my understanding of how rails handles things.

__Now for the interesting part__ (or at least I think so). For testing I did nothing at all, aside from going and having a look. Before Makers Academy I had not built anything complex, and since then everything I have made has had pretty comprehensive tests behind it. I had been _told_ the benefits of TDD, I had _read_ about the benefits of TDD, but realistically I had no real comprehension of this as I had nothing to compare it to. There was only one way to find out, and that was to write a reasonably large project without any tests.

This started off fast through the initial setup and into the first model, but everything went downhill from there. I went on a multi-hour goose chase re-writing parts of devise, totally unnecessarily. I quickly began to group changes to check and had to hunt down which particular change was responsible for the app breaking. Refactoring was a nightmare - as I went along I had to keep a mental ckecklist of everything that might go wrong and then go look.

What I discovered is that not testing is no faster. Testing gives you confidence in what you are doing. Testing tells you what you need to write. The most impactful thing was that _testing keeps you scoped_. Without a test to pass I moved in all kinds of directions, from one feature change to another, to tasks that were utterly not required.

Above all, what I learnt is that I am not writing a project without tests again. But at least now I know.

## Getting started

- Git clone https://github.com/alextwilson/instagram-challenge.git
- Navigate to the repo
- run bundle
- Start the server - run bin/rails s
- Go to http://localhost:3000/

## Functionality

A visitor can see the main feed of photos and the individual photo page without signing up, any other action requires signup/in.
A user can sign in and out, post and delete photos, and add a comment to any photo.
