import React, { Component } from 'react';
import GiphysIndexItem from './giphys_index_item';

class GiphysIndex extends React.Component {
  render() {
    const giphys = store.getState().giphys;
    return (
      <div>
        {giphys.map((giphy, idx) => (
          <GiphysIndexItem key={idx} giphy={giphy} />
        ))}
      </div>
    );
  }
}

export default GiphysIndex;
