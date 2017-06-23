import React, { Component } from 'react';
import SearchBar from '../components/SearchBar';
import MuseumsList from '../components/MuseumsList';

class MuseumsContainer extends Component {
  constructor (props) {
    super(props);
    this.state = {
      searchTerm: '',
      allMuseums: []
    };

    this.compare = this.compare.bind(this);
    this.getData = this.getData.bind(this);
    this.onChange = this.onChange.bind(this);
    this.findMuseums = this.findMuseums.bind(this);
  }

  compare (a, b) {
    const ratingA = a.rating;
    const ratingB = b.rating;

    let comparison = 0;
    if (ratingA < ratingB) {
      comparison = 1;
    } else if (ratingA > ratingB) {
      comparison = -1;
    }
    return comparison;
  }

  getData () {
    let MuseumContainer = this;
    fetch('/api/v1/museums.json')
      .then(response => {
        if (response.ok) {
          return response;
        } else {
          let errorMessage = `${response.status} ($response.statusText)`;
          let error = new Error(errorMessage);
          throw (error);
        }
      })
      .then(response => response.json())
      .then(body => body.sort(MuseumContainer.compare))
      .then(sortedMuseums => {
        MuseumContainer.setState({ allMuseums: sortedMuseums });
      })
      .catch(error => console.error(`Error in fetch ${error.message}`));
  }

  componentWillMount () {
    this.getData();
  }

  onChange (event) {
    let newSearchTerm = event.target.value;
    this.setState({ searchTerm: newSearchTerm });
  }

  findMuseums (searchTerm) {
    let allMuseums = this.state.allMuseums;
    let foundMuseums = [];
    console.log(searchTerm);
    allMuseums.forEach((museum) => {
      var museumMatch = false;
      if (museum.name.toLowerCase().includes(searchTerm.toLowerCase())) {
        museumMatch = true;
      }
      if (museumMatch) { foundMuseums.push(museum); }
    });
    return foundMuseums;
  }

  render () {
    var museumsToShow = [];
    if (this.state.searchTerm === '') {
      museumsToShow = this.state.allMuseums;
    } else {
      museumsToShow = this.findMuseums(this.state.searchTerm);
    }

    return (
      <div className="large-12 large-centered columns" id="Museums-Container">
        <SearchBar
          onChange={this.onChange}
          handleClear={this.handleClear}
          value={this.state.searchTerm}
        />
        <MuseumsList
          museums={museumsToShow}
        />
      </div>
    );
  }
}

export default MuseumsContainer;
