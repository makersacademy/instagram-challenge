'use strict'

window.onload = function() {
  getPosts();
}

function getPosts() {
  fetch('http://localhost:3000/posts_api.json')
    .then(function(res) {
      res.json().then(function(json) {
        let postArray = json
        console.log(JSON.stringify(postArray))
        renderPosts(postArray)
      });
    });
}

document.getElementById('Js-Send').addEventListener("click", function(event) {
  event.preventDefault();
  if (document.getElementById('post-image').files.length === 0) {
    event.preventDefault();
    let caption = document.getElementById('caption').value;
    console.log(`CAPTION IS ${caption}`);
    console.log(`now trying to create a post`)
    createPostWithoutImage(caption);
  }
});

function createPostWithoutImage(caption) {
  console.log(`in the createPost function. Caption is ${caption}`)
  console.log(`stringified json is ${JSON.stringify({ "post": { "caption": `${caption}` }})}`)
  fetch('http://localhost:3000/new_post_api', {
    method: 'POST',
    headers: {
         'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      "post": { "caption": `${caption}` }
    })
  }).then(function() {
    // would be good if this just inserted new post in front of other posts
    getPosts();
  })
}

function renderPosts(posts_array) {
  posts_array.forEach(function(post, index) {
    createPostDiv(index);
    setPostHTML(post, index);
  });
}

function createPostDiv(index) {
  let postDiv = document.createElement('div');
  postDiv.id = index;
  postDiv.className = "each-post";
  document.getElementById('posts').appendChild(postDiv);
}

function setPostHTML(post, index) {
  document.getElementById(index).innerHTML = postDetails(post);
  document.getElementById(index).innerHTML += postImageHTML(post);
  document.getElementById(index).innerHTML += postCaption(post);
}

function postDetails(post) {
  let postHTML =
  `<div class="post-details">
    <h4 class="post-username"> ${post.user.username} </h4>
    <h5 class="post-timestamp"> ${post.created_at} </h5>`;
  return postHTML;
}

function postImageHTML(post) {
  let imageHTML
  if (post.image_url) {
    imageHTML = `<div class="image" id="js-image"><img src="http://localhost:3000${post.image_url}"></div>`
  } else {
    imageHTML = `<div class="image">no picture this time!</div>`
  }
  return imageHTML;
}

function postCaption(post) {
  let postCaptionHTML =
    `<div class="post-caption"><p> ${post.caption} </p></div></div>`
  return postCaptionHTML;
}

    //
    // <div class="edit-del-links">
    //   <%# if post.user == current_user %>
    //     <%#= link_to 'Edit', edit_post_path(post.id) %>
    //     <%#= link_to 'Delete', post_path(post.id), method: "delete" %>
    //   <% end %>
    // </div>`;
    // document.getElementById(index).innerHTML = `${postHTML}`
