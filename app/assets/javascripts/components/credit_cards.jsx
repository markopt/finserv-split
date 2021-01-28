class CreditCard extends React.Component {
  render() {
    return(
      <div className="credit-card">
        <div className="grid-x grid-margin-x card-cell">
          <div className="cell medium-12">
            <h3 className="gotham-light">Community Bank { this.props.name }</h3><br />
            <div className="grid-x grid-margin-x">
              <div className="cell medium-4">
                <img src={ this.props.img } height="175px" width="280px"></img>
              </div>
              <div className="cell medium-2">
                <h4 className="gotham-book">Rewards</h4>
                <p className="gotham-light">{ this.props.rewards }</p>
              </div>
              <div className="cell medium-2">
                <h4 className="gotham-book">APR</h4>
                <p className="gotham-light">{ this.props.apr }</p>
              </div>
              <div className="cell medium-2">
                <h4>Annual Fee</h4>
                <p>{ this.props.fee }</p>
              </div>
              <div className="cell medium-2 vertical-align">
                <a href={`/apply?card=${ this.props.name }`}>
                  <button type="button submit" className="button">Learn more</button><br />
                </a>
              </div>
          </div>
        </div>
      </div>
    </div>
    );
  }
};