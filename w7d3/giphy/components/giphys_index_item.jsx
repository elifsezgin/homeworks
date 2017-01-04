import React, { Component } from 'react';

class GiphysIndexItem extends React.Component {
  constructor (props) {
    super(props);
  }
  render () {
    return (
      <li
        key={this.props.key}
        className='giphy-li'><img src={this.props.giphy.images.fixed_height.url} /></li>
    );
  }
}

export default GiphysIndexItem;
