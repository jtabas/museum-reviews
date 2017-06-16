import React, { Component } from 'react';
import Museum from './Museum';

class MuseumContainer extends Component {
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
    let newPage = this.state.currentPage - 1;
    this.setState({ currentPage: newPage })
  }

  nextPage(event) {
    let newPage = this.state.currentPage + 1;
    this.setState({ currentPage: newPage })
  }

  getData() {
    fetch('http://localhost:3000/api/v1/museums.json')
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
        this.setState({ museums: body });
      })
      .catch(error => console.error(`Error in fetch ${error.message}`));
  }

  componentDidMount() {
    this.getData()
  }

  render() {
    let indexOfLastMuseum = this.state.currentPage * this.state.museumsPerPage;
    let indexOfFirstMuseum = indexOfLastMuseum - this.state.museumsPerPage;

    let currentMuseums;

    if (indexOfFirstMuseum < 0 ) {
      currentMuseums = this.state.museums.slice(0, 6);
    } else if (indexOfLastMuseum > this.state.museums.length) {
      currentMuseums = this.state.museums.slice(this.state.museums.length - 6, this.state.museums.length)
    } else {
      currentMuseums = this.state.museums.slice(indexOfFirstMuseum, indexOfLastMuseum);
    }

    let newMuseums = currentMuseums.map((museum, index) => {
      return (
        <Museum
          key={index}
          id={index + 1}
          name={museum.name}
        />
      )
    });

    return (
      <div>
        {newMuseums}
      </div>
    )
  }
}

export default MuseumContainer;
