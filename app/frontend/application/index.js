import {render, h} from 'preact';
import NavBarComponent from 'Common/components/navbar';
import HomeSearchComponent from './home/home-search';
import './base.less';
import './home.less';
import './util.less';
import 'Common/components/card';
import 'Common/components/footer';
import 'Common/shadows.less'

// Tell Babel to transform JSX into preact.h() calls:
/** @jsx h */

const APPS = {
  NavBarComponent,
  HomeSearchComponent
};

function renderAppInElement(el) {
  const App = APPS[el.id];
  if (!App) return;

  // Get props from elements data attribute, like the post_id
  let data = el.getAttribute('data');
  data = JSON.parse(data);
  const props = Object.assign({}, data);

  console.log('rendering ' + el.id);

  render(
    <App {...props} />,
    el
  );
}

document.addEventListener('DOMContentLoaded', () => {
  document
    .querySelectorAll('.__react-root')
    .forEach(renderAppInElement);
});
