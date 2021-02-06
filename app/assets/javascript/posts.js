'use strict'

window.onload = function() {
  getPosts();
}

function getPosts() {
  fetch('http://localhost:3000/posts_api.json')
    .then(function(res) {
      res.json().then(function(json) {
        let postArray = json;
        renderPosts(postArray);
      });
    });
}

document.getElementById('Js-Send').addEventListener("click", function(event) {
  let captionField = document.getElementById('caption')
  if (document.getElementById('post_image').files.length === 0) {
    event.preventDefault();
    if (confirm('Send caption without a picture?')) {
      let caption = captionField.value;
      console.log(`now trying to create a post`)
      createPostWithoutImage(caption);
    }
  }
  captionField.value = "";
});

function createPostWithoutImage(caption) {
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
  document.getElementById('posts').innerHTML = "";
  posts_array.forEach(function(post, index) {
    createPostDiv(index);
    setPostHTML(post, index);
    if (isCurrentUser(post.user.username)) {
      document.getElementById(index).innerHTML += addEditAndDeleteButtons(post);
      addEditAndDeleteEventListeners(post);
    }
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

function addEditAndDeleteButtons(post) {
  let editAndDeleteButtonsHTML =
    `<div class="edit-del-links">
      <button class="delete-button" id="delete-post-${post.id}"><i class="far fa-trash-alt"></i></button>
      <button class="edit-button" id="edit-post-${post.id}"><i class="fas fa-pencil-alt"></i></button>
    </div>`
  return editAndDeleteButtonsHTML;
}

function addEditAndDeleteEventListeners(post) {
  let deleteButton = document.getElementById(`delete-post-${post.id}`);
  let editButton = document.getElementById(`edit-post-${post.id}`);
  deleteButton.addEventListener("click", function() {
    if (confirm("Are you sure you want to delete this post?")) {
      deletePost(post.id);
    }
  });
  editButton.addEventListener("click", function() {

  });
}

function deletePost(id) {
  console.log(`in the deletePost function`);
  fetch(`http://localhost:3000/posts/${id}`, {
    method: 'DELETE'
  })
  .then(function() {
    getPosts();
  });
}

function isCurrentUser(username) {
  return document.getElementById('current-user').innerHTML === username
}
