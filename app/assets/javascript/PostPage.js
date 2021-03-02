console.log("I am in postpage")


const p = React.createElement;
"------------------ POSTPAGE ---------------------"
class PostPage extends React.Component {

constructor(props){
    super(props);
    this.state = { list: []}
    this.getPosts();
}

getPosts() {
    let url = "/index_API"
    let postsDiv = document.getElementById('display-posts')
    fetch(url).then((response) => response.json())
    .then((data) => this.setState({list: data}));
}

render() {
    return p(
      "div",
      undefined,
      this.state.list.map((post_data) => {
        return p(Post, post_data, undefined);
      })
    );
  }  
}

"------------------ POST ---------------------"
class Post extends React.Component {
    render() {
        return p(
            "div", 
            undefined,
            [
            p("p", undefined, `${this.props.description}`),
            p("p", undefined,  `created at ${this.props.created_at}`),
            p("p", undefined, `added by ${this.props.username}`)
            ]
        )
    }

}


const pageContainer = document.getElementById("posts-page");
ReactDOM.render(p(PostPage), pageContainer);