import React, { Fragment, useEffect } from 'react';
import { fechRestaurants } from '../apis/restaurants.js'

export const Restaurants = () => {
	useEffect(() => {
		fechRestaurants()
			.then((data) =>
				console.log(data)
			)
	}, [])
	return (
		<Fragment>
			レストラン一覧
		</Fragment>
	)
}
