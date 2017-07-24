import {render, h} from 'preact';
import NavBarComponent from 'Common/components/navbar';
import './base.less';
import 'Common/shadows.less'

// Tell Babel to transform JSX into preact.h() calls:
/** @jsx h */

const APPS = {
  NavBarComponent
};

function renderAppInElement(el) {
  const App = APPS[el.id];
  if (!App) return;

  // Get props from elements data attribute, like the post_id
  let data = el.getAttribute('data');
  data = JSON.parse(data);
  const props = Object.assign({}, data);

  render(
    <App {...props} />,
    el
  );
}

document.addEventListener('DOMContentLoaded', () => {
  document
    .querySelectorAll('.__react-root')
    .forEach(renderAppInElement);

  console.log('here i am');
});

