import React, { Component } from 'react';

class Museum extends Component {
  constructor(props) {
    super(props)
  }

  render() {
    return (
      <div>
        <a href={`/museums/${this.props.id}`}>
          <h2>{this.props.name}</h2>
        </a>
      </div>
    );
  }
}

export default Museum;
