import React from "react"
import PropTypes from "prop-types"

class Main extends React.Component {
  render () {
    return (
      <React.Fragment>
        Greeting: {this.props.greeting} - chris lemon
      </React.Fragment>
    );
  }
}

Main.propTypes = {
  greeting: PropTypes.string
};

export default Main
