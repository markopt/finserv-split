class CardApplication extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      cardType: null
    };
  }

  componentWillMount() {
    this.parseParams();
  }

  parseParams() {
    const param = window.location.search.substring(window.location.search.indexOf('?') + 6);
    const cardNameArray = param.split("%20");
    const cardNameString = cardNameArray.join(" ");

    this.setState({
      cardType: cardNameString
    });
  }

  render() {
    return(
      <CardApplicationForm cardType={ this.state.cardType } />
    )
  }
};