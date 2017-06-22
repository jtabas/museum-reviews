import React from 'react';
const SearchBar = props => {
  return (
    <div className="search-bar small-12 columns" >
      <h4>
        Search for a Museum:
      </h4>
      <input
        type='text'
        placeholder="Search"
        value={props.value}
        onChange={props.onChange}
      />
    </div>
  );
}

export default SearchBar;
