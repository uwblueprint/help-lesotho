import { render, h, Component } from 'preact';
import axios from 'Common/helpers/axios';

// Tell Babel to transform JSX into preact.h() calls:
/** @jsx h */

export default class NavBarComponent extends Component {
  handleSignOut = () => {
    axios
      .request({
        method: 'delete',
        url: '/users/sign_out'
      })
      .then(() => {
        window.location.replace('/');
      })
      .catch((e) => {
        console.error('couldnt sign out', e);
      });
  }

  render({ logged_in }) {
    return (
      <NavBar
        logged_in={ logged_in }
        handleSignOut={ this.handleSignOut }
      />
    )
  }
};

const NavBar = ({ handleSignOut, logged_in }) => {
  let sessionButtons = null;
  if (logged_in) {
    sessionButtons = (
      <ul class="list-reset right-align my0">
        <li class="inline-block">
          <button class="navbar-listText buttonLink bold text-decoration-none p2" onClick={() => handleSignOut()}>Sign Out</button>
        </li>
      </ul>
    );
  } else {
    sessionButtons = (
      <ul class="list-reset right-align my0">
        <li class="inline-block my2">
          <a class="navbar-listText bold text-decoration-none p2" href="/users/sign_in">Sign In</a>
        </li>
        <li class="inline-block my2">
          <a class="navbar-listText bold text-decoration-none p2" href="/users/sign_up">Sign Up</a>
        </li>
      </ul>
    )
  }

  return (
    <nav class="navbar box-shadow-3">
      {sessionButtons}
    </nav>
  );
};
