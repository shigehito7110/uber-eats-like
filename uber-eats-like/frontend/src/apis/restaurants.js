import axios from 'axios';

import { restaurantsindex } from '../urls/index.js'

export const fetchRestaurants = () => {
  return axios.get(restaurantsindex)
    .then(res => {
      return res.data
    })
    .catch((e) => console.error(e))
}
