import { render, h, Component } from 'preact';

// Tell Babel to transform JSX into preact.h() calls:
/** @jsx h */

class AdminAppComponent extends Component {
  constructor() {
    super();
    this.state = {};
  }

  render(props, state) {
    return <AdminApp />
  }
};

const AdminApp = props => {
  return <h1>Admin App</h1>
};
