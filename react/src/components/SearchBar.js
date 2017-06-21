import React from 'react'
const SearchBar = props => {
  return (
    <div className="search-bar" >
      <label htmlFor="search-bar">
        Search for a Museum:
      </label>
      <input
        type='text'
        value={props.value}
        onChange={props.onChange}
      />
    </div>
  )
}

export default SearchBar;
