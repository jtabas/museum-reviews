import React from 'react'
const SearchBar = props => {
  return (
    <div className="text-center">
       <button className="hollow button numbers" onClick={props.previousPage}>
         Previous Page
       </button>
       <button className="hollow button numbers" onClick={props.nextPage}>
         Next Page
       </button>
    </div>
  )
}

export default SearchBar;
