'use strict';

class PostComponent extends React.Component {
  constructor() {
    super();
    this.state = {};
  }

  componentDidMount() {
    this.fetchData(`/posts/feed/img?img=${this.props.data._id}`);
  }

  fetchData = (apiToFetch) => {
    fetch(apiToFetch)
      .then(res => res.json())
      .then((data) => {
        this.setState({
          image: data
        });

      })
  }

  render() {
    let data = this.props.data.img.data;
    return(
      <div>
        <div>

          <p>{this.props.data.userName}</p>
          {this.state.image ? <div class="pictureContainer">
            <img class='pic' key={this.props.data._id} src={`data:image/png;base64,${ this.state.image.binary }`}></img>
          </div>: " "}

        </div>
      </div>
    );
  }
}
