import { render, h, Component } from 'preact';

// Tell Babel to transform JSX into preact.h() calls:
/** @jsx h */

export default class AdminAppComponent extends Component {
  render() {
    return <AdminApp />;
  }
}

const AdminApp = (props) => {
  return (
    <h1>Hello world</h1>
  );
};

render(
  <AdminAppComponent />,
  document.body
)
