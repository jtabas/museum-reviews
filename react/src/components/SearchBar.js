import React from 'react';
const SearchBar = props => {
  return (
    <div className="search-bar small-10 columns" >
      <label htmlFor="search-bar">
        Search for a Museum:
      </label>
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
