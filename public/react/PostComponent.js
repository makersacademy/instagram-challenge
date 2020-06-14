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

  formatDate(date) {
    return new Date(date).toLocaleString();
  }

  render() {
    let data = this.props.data;
    return(
      <div>
        <div>
          <p>{data.userName} posted on {this.formatDate(data.datePosted)}</p>
          <p>{data.caption}</p>
          {this.state.image ? <div class="pictureContainer">
            <img class='pic' key={data._id} src={`data:image/png;base64,${ this.state.image.binary }`}></img>
          </div>: " "}

        </div>
      </div>
    );
  }
}
