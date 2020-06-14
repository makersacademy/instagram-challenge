'use strict';

class PostListComponent extends React.Component {
  constructor() {
    super();
    this.state = {
      posts: []
    };
  }

  componentDidMount() {
    this.fetchData('/posts');
  }
  fetchData = (apiToFetch) => {
    fetch(apiToFetch)
      .then(res => res.json())
      .then((data) => {
        this.setState({
          posts: data
        });
      });
  }

  render() {
    return (
      <div>
        <h1>Posts</h1>
        <FormComponent />
        {this.state.posts.map((post) => {
          return (
            <p class='pic'>{post}</p>
            );
          }
        )}
      </div>
    )
  }
}

ReactDOM.render(<PostListComponent />, document.getElementById('app'));
