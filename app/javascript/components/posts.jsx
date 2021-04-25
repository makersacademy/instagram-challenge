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
    // set up url for the fetch method
    const url = "/api/posts";
    // call the rails api for the data
    fetch(url)
      .then(response => {
        if (response.ok) {
          return response.json();
        }
        throw new Error("Network response was not ok.");
      })
      // save the response in the state
      .then(response => this.setState({ posts: response }))
      .catch(() => this.props.history.push("/posts"));
  }

  render() {
    // get posts from the state
    const { posts } = this.state;
    // create the post elements within the allPosts const to be displayed later
    const allPosts = posts.map((post, index) => (
      <div key={index} className="col-md-6 col-lg-4">
        <div className="card mb-4">
          {/* calls the image */}
          <img
            src={post.image}
            className="card-img-top"
            alt={`${post.name} image`}
          />
          {/* calls the image description which links to the posts own page */}
          <div className="card-body">
            <Link to={`/posts/${post.id}`} className="post-click">
            <h5>{post.description}</h5>
            </Link>
          </div>
        </div>
      </div>
    ));
    // if there are no posts in the response it shows this element
    const noPost = (
      <div className="vw-100 vh-50 d-flex align-items-center justify-content-center">
        <h4>
          No posts yet. Why not <Link to="/new_post">create one</Link>
        </h4>
      </div>
    );

    return (
      <>
        {/* a header for the page  */}
        <div className="container py-5">
          <h1 className="display-4">Procrastagram</h1>
          <p className="lead">
            Sit, relax, you've got important things to do. So why not spend some time
            aimlessly scrolling through images. It's your life, waste it.
          </p>
          <hr/>
        </div>
        <div className="py-5">
          <main className="container">
            {/* displays the allPosts const if there are any in the state */}
            <div className="row">
              {posts.length > 0 ? allPosts : noPost}
            </div>
          </main>
        </div>
      </>
    );
  }
}
export default Posts;