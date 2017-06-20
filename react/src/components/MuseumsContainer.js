import React, { Component } from 'react';
import Museum from './Museum';

class MuseumsContainer extends Component {
  constructor(props) {
    super(props)
      this.state = {
        museums: [],
        currentPage: 1,
        museumsPerPage: 6
      }
    this.getData = this.getData.bind(this);
    this.previousPage = this.previousPage.bind(this);
    this.nextPage = this.nextPage.bind(this);
  }

  previousPage(event) {
    if (this.state.currentPage != 1) {
      let newPage = this.state.currentPage - 1;
      this.setState({ currentPage: newPage });
    }
  }

  nextPage(event) {
    if (this.state.currentPage * this.state.museumsPerPage < this.state.museums.length) {
      let newPage = this.state.currentPage + 1;
      this.setState({ currentPage: newPage });
    }
  }

  getData () {
    fetch('http://localhost:3000/api/v1/museums.json')
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
      .then(body => {
        this.setState({ museums: body });
      })
      .catch(error => console.error(`Error in fetch ${error.message}`));
  }

  componentWillMount () {
    this.getData();
  }

  render() {
    let indexOfLastMuseum = this.state.currentPage * this.state.museumsPerPage;
    let rightBoundIndex = this.state.museums.length;
    let indexOfFirstMuseum = indexOfLastMuseum - this.state.museumsPerPage;
    let currentMuseums;

    if (indexOfFirstMuseum <= 0 ) {
      currentMuseums = this.state.museums.slice(0, 6);
    } else if (indexOfLastMuseum > this.state.museums.length) {
      indexOfLastMuseum = (this.state.currentPage - 1) * this.state.museumsPerPage;
      currentMuseums = this.state.museums.slice(indexOfLastMuseum, rightBoundIndex);
    } else {
      currentMuseums = this.state.museums.slice(indexOfFirstMuseum, indexOfLastMuseum);
    }

    let newMuseums = currentMuseums.map((museum, index) => {
      return (
        <Museum
          key={index}
          id={museum.id}
          name={museum.name}
        />
      );
    });
    return (
      <div>
        <h1>Museums</h1>
        {newMuseums}
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
