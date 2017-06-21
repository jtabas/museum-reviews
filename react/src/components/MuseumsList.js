import React, { Component } from 'react';
import Museum from './Museum';
import PaginationButtons from './PaginationButtons';


class MuseumsList extends Component {
  constructor (props) {
    super(props);
    this.state = {
      museums: [],
      currentPage: 1,
      museumsPerPage: 6
    };

    this.previousPage = this.previousPage.bind(this);
    this.nextPage = this.nextPage.bind(this);
  }

  componentWillReceiveProps (nextProps) {
    this.setState({ museums: nextProps.museums });
  }

  previousPage (event) {
    if (this.state.currentPage !== 1) {
      let newPage = this.state.currentPage - 1;
      this.setState({ currentPage: newPage });
    }
  }

  nextPage (event) {
    if (this.state.currentPage * this.state.museumsPerPage < this.state.museums.length) {
      let newPage = this.state.currentPage + 1;
      this.setState({ currentPage: newPage });
    }
  }

  render () {
    let indexOfLastMuseum = this.state.currentPage * this.state.museumsPerPage;
    let rightBoundIndex = this.state.museums.length;
    let indexOfFirstMuseum = indexOfLastMuseum - this.state.museumsPerPage;
    let currentMuseums;

    if (indexOfFirstMuseum <= 0) {
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

    let buttons = null;
    if (this.state.museums.length > this.state.museumsPerPage) {
      buttons = <PaginationButtons
      previousPage={this.previousPage}
      nextPage={this.nextPage}
      />;
    }

    return (
      <div>
        {newMuseums}
        {buttons}
      </div>
    );
  }
}

export default MuseumsList;
