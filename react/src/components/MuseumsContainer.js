import React, { Component } from 'react';
import Museum from './Museum';

class MuseumsContainer extends Component {
  constructor (props) {
    super(props);
    this.state = {
      museums: []
    };
    this.getData = this.getData.bind(this);
    this.previousPage = this.previousPage.bind(this);
    this.nextPage = this.nextPage.bind(this);
  }

  getData () {
    fetch('/api/v1/museums.json')
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status} ($response.statusText)`,
            error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => response.json())
      .then(body => {
        this.setState({ museums: body.sort(this.compare) });
      })
      .catch(error => console.error(`Error in fetch ${error.message}`));
  }

<<<<<<< HEAD
  componentWillMount () {
    this.getData();
  }

  compare (firstMuseum, secondMuseum) {
    const ratingA = firstMuseum.rating;
    const ratingB = secondMuseum.rating;

    let comparison = 0;
    if (ratingA < ratingB) {
      comparison = 1;
    } else if (ratingA > ratingB) {
      comparison = -1;
    }
    return comparison;
  }

  render() {

    return (
      <div>
        <h1>Museums</h1>
        <MuseumsList
          museums={this.state.museums}
          />
        <div className="text-center">
          <button className="hollow button numbers" onClick={this.previousPage}>
            Previous Page
          </button>
          <button className="hollow button numbers" onClick={this.nextPage}>
            Next Page
          </button>
        </div>
      </div>
    );
  }
}

export default MuseumsContainer;
