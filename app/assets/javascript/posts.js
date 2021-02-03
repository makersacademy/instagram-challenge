console.log(`in posts.js`)

window.onload = function() {
  getPosts();
}

function getPosts() {
  fetch('http://localhost:3000/posts_api.json')
    .then(function(res) {
      res.json().then(function(json) {
        console.log(`in the second then ${json[0].id}`)
        let postArray = json
        console.log(`in the second then ${json}`)
        renderPosts(postArray)
      });
    });
}

function renderPosts(posts_array) {
  posts_array.forEach(function(post, index) {
    console.log(`Post ${index} = ${post}`);
    console.log(JSON.stringify(post))
    createPostDiv(index);
    setPostHTML(post, index);
  });
}

function createPostDiv(index) {
  let postDiv = document.createElement('div');
  postDiv.id = index;
  postDiv.className = "each-post";
  document.getElementById('js-posts').appendChild(postDiv);
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
    <h5 class="post-timestamp"> ${post.created_at} </h5>
  <div class="image">`;
  return postHTML;
}

function postImageHTML(post) {
  let imageHTML
  if (post.image_url) {
    console.log(`this post has an image url ${post.image_url}`)
    imageHTML = `<img src="${post.image_url}"`
    // .variant(resize_to_fit: [210, 180])?
  } else {
    console.log(`this post does not have an image url`)
    imageHTML = `no picture this time!`
  }
  return imageHTML;
}

function postCaption(post) {
  let postCaptionHTML =
    `<div class="post-caption">
      <p> ${post.caption} </p>
    </div>`
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
