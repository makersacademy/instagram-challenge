'use strict'

window.onload = function() {
  getPosts();
}

var modal = document.getElementById('edit-modal');

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
  let captionField = document.getElementById('caption')
  if (document.getElementById('post_image').files.length === 0) {
    event.preventDefault();
    if (confirm('Send caption without a picture?')) {
      let caption = captionField.value;
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
    postDiv.innerHTML += addEditAndDeleteButtons(post);
    addEditAndDeleteEventListeners(post);
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
  let postCaptionHTML = `<div class="post-caption" id="caption-${post.id}"><p> ${post.caption} </p></div>`
  postDiv.innerHTML += postCaptionHTML;
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
    document.getElementById('edit-caption').value = post.caption
    document.getElementById('edit-post-id').value = post.id
    modal.style.display = "block";
  });
}

function deletePost(id) {
  fetch(`http://localhost:3000/posts/${id}`, {
    method: 'DELETE'
  })
  .then(function() {
    getPosts();
  });
}

document.getElementsByClassName('close')[0].addEventListener("click", function() {
  modal.style.display = "none";
})

window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

document.getElementById('save-edit').addEventListener("click", function(event) {
  event.preventDefault();
  let updatedCaption = document.getElementById('edit-caption').value;
  let postID = document.getElementById('edit-post-id').value;
  fetch(`http://localhost:3000/posts/${postID}`, {
    method: 'PATCH',
    headers: {
         'Content-Type': 'application/json'
    },
    body: JSON.stringify({
      "post" : { "caption" : `${updatedCaption}`}
    })
  }).then(function() {
    document.getElementById(`caption-${postID}`).innerHTML = `<p>${updatedCaption} <em>(edited)</em>`
  })
});

function isCurrentUser(username) {
  return document.getElementById('current-user').innerHTML === username
}
