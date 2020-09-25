export default {
  getPosts: () => {
    return fetch('/post')
      .then(res => res.json())
      .then(data => data);
  },
  deletePost : (_id) => {
    return fetch(`/post/${_id}`,
                {method : "delete"})
                .then(res => res.json())
                .then(data => data);
  },
  updatePost : (post) => {
    return fetch(`/post/${post._id}`,
                {method : "put",
                body: JSON.stringify(post),
                headers : {
                "Content-type" : "application/json"
              }}).then(res => res.json())
                .then(data => data);
  },
  createPost : (post) => {
    return fetch(`/post`,
                {method : "post",
                body: JSON.stringify(post),
                headers : {
                "Content-type" : "application/json"
              }}).then(res => res.json())
                .then(data => data);
  },
}