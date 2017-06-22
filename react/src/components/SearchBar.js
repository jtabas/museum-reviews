import React from 'react';
const SearchBar = props => {
  return (
    <div className="search-bar small-12 columns" >
<<<<<<< HEAD
      <h4>
        Search for a Museum:
      </h4>
=======
>>>>>>> master
      <input
        type='text'
        placeholder="Search for a Museum"
        value={props.value}
        onChange={props.onChange}
      />
    </div>
  );
}

export default SearchBar;
