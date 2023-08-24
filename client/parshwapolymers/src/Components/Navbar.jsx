import React, {  useState } from 'react'

export default function Navbar() {
  const [isNavExpanded, setIsNavExpanded] = useState(false);
  return (
    <header className='Headrer'>
      <div className='hero-title' id='hero-title'>Parshwa Polymers</div>
      <nav className='navigation'>
        <button className="hamburger" onClick={() => { setIsNavExpanded(!isNavExpanded); }}>
          <svg
            xmlns="http://www.w3.org/2000/svg"
            className="h-5 w-5"
            viewBox="0 0 20 20"
            fill={!isNavExpanded ? "#d8d9d4" : "#5075b2"}
          >
            <path
              fillRule="evenodd"
              d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM9 15a1 1 0 011-1h6a1 1 0 110 2h-6a1 1 0 01-1-1z"
              clipRule="evenodd"
            />
          </svg>
        </button>
        <div className={isNavExpanded ? "nav-menu expanded" : "nav-menu"}>
          <ul className='nav-links'>
            <li><a className='li' href='/' onClick={()=>{setIsNavExpanded(!isNavExpanded)}}>Home</a></li>
            <li><a className='li' href='#products' onClick={()=>{setIsNavExpanded(!isNavExpanded)}}>Products</a></li>
            <li><a className='li' href='#about' onClick={()=>{setIsNavExpanded(!isNavExpanded)}}>About</a></li>
            <li><a className='li' href='#contact' onClick={()=>{setIsNavExpanded(!isNavExpanded)}}>Contact</a></li>
          </ul>
        </div>
      </nav>
    </header>
  )
}
