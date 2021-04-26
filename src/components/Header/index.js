import React from 'react';
import "./Header.css";

class Header extends React.Component {
  render(){
    return (
      <nav className="Nav">
        <div className="Nav-menus">
          <div className="Nav-brand">
            <div className="Nav-brand-logo" href="/">
              Finstagram
            </div>
          </div>
        </div>
      </nav>
    )
  }
}
export default Header;
