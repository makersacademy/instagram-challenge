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
    let date = moment(data.datePosted).fromNow();
    return(
      <div className="postContainer" >
        <div>
          <p className="caption"><span className="userName">{data.userName}</span></p>
          <p className="caption">{date}</p>
          {this.state.image ? <div class="pictureContainer">
            <img className='pic' key={data._id} src={`data:image/png;base64,${ this.state.image.binary }`}></img>
          </div>: " "}
          <p className="caption">{data.caption}</p>
        </div>
      </div>
    );
  }
}
