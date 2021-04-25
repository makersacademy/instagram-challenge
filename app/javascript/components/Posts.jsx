import React from "react";
import { Link } from "react-router-dom";

class Posts extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      posts: []
    };
  }

  componentDidMount() {
    const user_id = localStorage.getItem("id")
    const url = `/api/v1/posts/show/${user_id}`;
    fetch(url)
      .then(response => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      .then(response => {
        console.log(response)
        this.setState({ posts: [response] })
      })
      // If theres an error
      .catch(() => this.props.history.push("/"));
  }

  render() {
    const { posts } = this.state;
    console.log(posts);
    const allPosts = posts.map((post, index) => (
      <div key={index} className="col-md-6 col-lg-4">
        <div className="card mb-4">
          <img
            src={post.image}
            className="card-img-top"
            alt={`${post.username} image`}
          />
          <div className="card-body">
            <h5 className="card-title">{post.name}</h5>
            <Link to={`/recipe/${post.id}`} className="btn custom-button">
              View Post
            </Link>
          </div>
        </div>
      </div>
    ));
    const noPost = (
      <div className="vw-100 vh-50 d-flex align-items-center justify-content-center">
        <h4>
          {/* CHANGE LINK OR REMOVE LINK IF CREATING FIELD FOR NEW POSTS */}
          No posts yet. Why not <Link to="/">create one (only shown if logged in)</Link>
        </h4>
      </div>
    );

    return (
      <>
        <section className="jumbotron jumbotron-fluid text-center">
          <div className="container py-5">
            <h1 className="display-4">Instagram feed</h1>
          </div>
        </section>
        <div className="py-5">
          <main className="container">
            <div className="text-right mb-3">
              <Link to="/" className="btn custom-button">
                Create New Post - replace with a form
              </Link>
            </div>
            <div className="row">
              {posts.length > 0 ? allPosts : noPost}
            </div>
            <Link to="/" className="btn btn-link">
              Replace with a logout button - erase localStorage
            </Link>
          </main>
        </div>
      </>
    );
  }

}
export default Posts;