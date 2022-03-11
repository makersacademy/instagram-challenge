'use strict'

// Allow 10 mins (600000ms) from posting to editing
const UPDATABLE_TIME = 600000

window.onload = function() {
  getPosts();
}

var allPostsDiv = document.getElementById('posts');

function getPosts() {
  fetch('http://localhost:3000/posts_api.json').then(function(res) {
    res.json().then(function(json) {
      let postArray = json;
      renderPosts(postArray);
    });
  });
}

document.getElementById('Js-Send').addEventListener("click", function(event) {
  if (document.getElementById('post_image').files.length === 0) {
    event.preventDefault();
    let captionField = document.getElementById('postcaption')
    if (confirm('Send caption without a picture?')) {
      let caption = captionField.value;
      createPostWithoutImage(caption);
      captionField.value = "";
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
  }).then(function(res) {
    res.json().then(function(post) {
      renderIndividualPost(post)
    })
  })
}

function renderPosts(posts_array) {
  allPostsDiv.innerHTML = "";
  posts_array.forEach(function(post) {
    renderIndividualPost(post);
  });
}

function renderIndividualPost(post) {
  let postDiv = document.createElement('div');
  postDiv.id = post.id;
  postDiv.className = "each-post";
  allPostsDiv.prepend(postDiv);
  addPostDetails(post, postDiv);
  addPostImageHTML(post, postDiv);
  postCaption(post, postDiv);
  if (isCurrentUser(post.user.username)) {
    addEditAndDeleteButtons(post, postDiv);
  }
}

function addPostDetails(post, postDiv) {
  let postDetailsDiv = document.createElement('div');
  postDetailsDiv.className = "post-details";
  postDetailsDiv.innerHTML =
    `<h4 class="post-username"> ${post.user.username} </h4>
    <h5 class="post-timestamp"> ${post.created_at} </h5>`;
  postDiv.appendChild(postDetailsDiv);
}

function addPostImageHTML(post, postDiv) {
  let imageHTML
  if (post.image_url) {
    imageHTML = `<div class="image">
                  <img src="http://localhost:3000${post.image_url}">
                </div>`
  } else {
    imageHTML = `<div class="image">no picture this time!</div>`
  }
  postDiv.innerHTML += imageHTML;
}

function postCaption(post, postDiv) {
  if (post.created_at === post.updated_at) {
    var postCaptionHTML = `<div class="post-caption" id="caption-${post.id}"><p>${post.caption}</p></div>`
  } else {
    var postCaptionHTML = `<div class="post-caption" id="caption-${post.id}"><p>${post.caption} <em>(edited)</em></p></div>`
  }
  postDiv.innerHTML += postCaptionHTML;
}

function addEditAndDeleteButtons(post, postDiv) {
  let userButtonsDiv = document.createElement('div');
  userButtonsDiv.className = "edit-del-links";
  postDiv.appendChild(userButtonsDiv);
  addDeleteButton(post, userButtonsDiv);
  if (isUpdatable(post)) {
    addEditButton(post, userButtonsDiv);
  }
}

function addDeleteButton(post, div) {
  let deleteButton = document.createElement('button');
  deleteButton.className = "delete-button";
  deleteButton.id = `delete-post-${post.id}`;
  deleteButton.innerHTML = `<i class="far fa-trash-alt"></i>`;
  div.appendChild(deleteButton);
  deleteButton.addEventListener("click", function() {
    if (confirm("Are you sure you want to delete this post?")) {
      deletePost(post.id);
    }
  });
}

function addEditButton(post, div) {
  let editButton = document.createElement('button');
  editButton.className = "edit-button"
  editButton.id = `edit-post-${post.id}`;
  editButton.innerHTML = `<i class="fas fa-pencil-alt"></i>`
  div.appendChild(editButton);
  editButton.addEventListener("click", function() {
    editPost(post, editButton);
  });
  setTimeout(function() {
    editButton.remove()
  }, UPDATABLE_TIME - (Date.now() - Date.parse(post.created_at)))
}

function editPost(post, editButton) {
  let captionArea = document.getElementById(`caption-${post.id}`)
  captionArea.innerHTML = `<textarea type="text" id="test-edit-input" class="caption" />`
  document.getElementById(`test-edit-input`).value = post.caption
  let updateButton = document.createElement('INPUT')
  updateButton.setAttribute("type", "submit")
  updateButton.setAttribute("value", "Update")
  editButton.after(updateButton);
  editButton.remove();
  updateButton.addEventListener("click", function(event) {
    event.preventDefault();
    updatePost(post.id);
    updateButton.after(editButton);
    updateButton.remove();
  })
}

function deletePost(id) {
  fetch(`http://localhost:3000/posts/${id}`, {
    method: 'DELETE'
  }).then(function() {
    getPosts();
  });
}

function updatePost(id) {
  let updatedCaption = document.getElementById('test-edit-input').value;
  fetch(`http://localhost:3000/posts/${id}`, {
    method: 'PATCH',
    headers: {
         'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      "post" : { "caption" : `${updatedCaption}`}
    })
  }).then(function() {
    document.getElementById(`caption-${id}`).innerHTML = `<p>${updatedCaption} <em>(edited)</em>`
  })
}

function isCurrentUser(username) {
  return document.getElementById('current-user').innerHTML === username
}

function isUpdatable(post) {
  return Date.now() - Date.parse(post.created_at) < UPDATABLE_TIME
}
