import { render, h, Component } from 'preact';
import querystring from 'querystring';

// Tell Babel to transform JSX into preact.h() calls:
/** @jsx h */

export default class HomeSearchComponent extends Component {
  constructor() {
    super();

    this.state = {
      query: ""
    };
  }

  handleChange = (e) => {
    this.state.query = e.target.value;
  }

  handleSubmit = (e) => {
    e.preventDefault();
    const params = querystring.stringify({ query: this.state.query });
    window.location.assign(`/posts/search?${params}`);
  }

  render({ query }) {
    return (
      <HomeSearch
        handleSubmit={ this.handleSubmit }
        handleChange={ this.handleChange }
        query={ this.state.query }
      />
    );
  }
}

const HomeSearch = (props) => {
  const { handleChange, handleSubmit, query } = props;

  return (
    <div class="p1">
      <h1 class="h5 regular">Have a question about sex, AIDS, or anything else?</h1>
      <form class="table" onSubmit={ handleSubmit }>
        <label class="table-cell full-width">
          <input class="full-width align-middle border-none" type="text" value={ query } placeholder="Search for anything here" onInput={ handleChange } />
        </label>
        <input class="table-cell align-middle btn btn-secondary ml1" type="submit" value="Submit" />
      </form>
    </div>
  );
};
