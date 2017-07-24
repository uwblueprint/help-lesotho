import axios from 'axios';

function findToken() {
  return document.head.querySelector("meta[name='csrf-token']").content;
}

const axiosInstance = axios.create({
  headers: {
    'X-CSRF-Token': findToken(),
    'Accept': 'application/json'
  }
});

export default axiosInstance;
