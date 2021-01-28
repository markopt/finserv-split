class CardApplicationForm extends React.Component {
  render() {
    return(
        <div className="grid-x grid-margin-x">
          <div className="cell small-10 small-offset-1">
            <div className="text-center">
              <h1 className="gotham-light application-form">Apply For the { this.props.cardType }</h1>
            </div><hr />
            <form className="grid-x grid-margin-x">
              <div className="cell medium-6">
                <label for="firstNameInput">First Name</label>
                <input type="text" className="form-control" id="firstNameInput" placeholder="Enter First Name" />
              </div>
              <div className="cell medium-6">
                <label for="lastNameInput">Last Name</label>
                <input type="text" className="form-control" id="lastNameInput" placeholder="Enter Last Name" />
              </div>
              <div className="cell medium-12">
                <label for="ssnInput">Social Security Number</label>
                <input type="text" className="form-control" id="ssnNameInput" placeholder="XXX-XX-XXXX" />
              </div>              
              <div className="cell medium-12">
                <label for="streetInput">Street Address</label>
                <input type="text" className="form-control" placeholder="Enter Street Address" />
              </div>
              <div className="cell medium-4">
                <label for="cityInput">City</label>
                <input type="text" className="form-control" placeholder="Enter City" />
              </div>
              <div className="cell medium-4">
                <label for="stateInput">State</label>
                <input type="text" className="form-control" placeholder="Enter State" />
              </div>
              <div className="cell medium-4">
                <label for="zipInput">Zip Code</label>
                <input type="text" className="form-control" placeholder="Enter Zip Code" />
              </div>
              <div className="credit-card submit-div cell medium-4 medium-offset-4">
                <a href="/">
                  <button type="submit" id="submit" className="button">SUBMIT</button><br />
                </a>
              </div>
            </form>
          </div>
        </div>
    );
  }
};