'use strict';

class PostListComponent extends React.Component {
  constructor() {
    super();
    this.state = {
      posts: []
    };
  }

  componentDidMount() {
    this.fetchData('/posts/feed');
  }

  fetchData = (apiToFetch) => {
    fetch(apiToFetch)
      .then(res => res.json())
      .then((data) => {
        this.setState({
          posts: data
        });
      })
  }

  updateState = () => {
    this.fetchData('/posts/feed')
  }

  sortPostsByNewest = () => {
    return this.state.posts.sort(function(postA, postB) {
      let dateA = new Date(postA.datePosted);
      let dateB = new Date(postB.datePosted);
      return dateB - dateA;
    });
  }

  render() {
    return (
      <div>
        <h1>Latest posts</h1>
        <FormComponent updatemethod={this.updateState}/>
        <div className="feedContainer">
        {this.sortPostsByNewest().map((post) => {
          return (
            <PostComponent data={post} updatemethod={this.updateState}/>
            );
          }
        )}
        </div>
      </div>
    )
  }
}

ReactDOM.render(<PostListComponent />, document.getElementById('app'));
