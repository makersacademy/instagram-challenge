'use strict';

class PostListComponent extends React.Component {
  constructor() {
    super();
    this.state = {};
  }

  render() {
    return (
      <div>
        <h1>Posts</h1>
        <FormComponent />
      </div>
    )
  }
}

ReactDOM.render(<PostListComponent />, document.getElementById('app'));
