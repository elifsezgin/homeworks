import React, { Component } from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor () {
    super();
    this.state = {searchTerm: ""};

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  handleChange (e) {
    this.setState({searchTerm: e.target.value});
  }

  handleSubmit (e) {
    e.preventDefault();
    const searchTerm = this.state.searchTerm;
    this.props.fetchSearchGiphys(searchTerm);
    this.setState({searchTerm: ""});
  }

  render() {
    return (
      <div>
        <form onSubmit={this.handleSubmit}>
            <input
              type='text'
              value={this.state.searchTerm}
              placeholder='puppies'
              onChange={this.handleChange}
              required/>
            <button value='submit'>Submit</button>
        </form>
        <GiphysIndex />
      </div>
    );
  }
}

export default GiphysSearch;
