import React from "react";

const Main = ({ greeting }: MainProps) => {
    return (
      <React.Fragment>
        Greeting: {greeting} - chris lemon
      </React.Fragment>
    );
}

interface MainProps {
  greeting: string
};

export default Main;
