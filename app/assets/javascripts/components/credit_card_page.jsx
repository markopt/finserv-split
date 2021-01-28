class CreditCardPage extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      data: [
        <CreditCard 
          name={"Platinum credit card"}
          rewards={"Earn unlimited cash back. Earn unlimited 1.5% cash back on every purchase - it's automatic. No minimum to redeem for cash back"}
          img={"https://s3-us-west-1.amazonaws.com/finserv-images/SilverCardImage%402x.png"} 
          apr={"0% intro APR for 15 months from account opening on purchases and balance transfers. After that, 15.99-24.74% variable APR"} 
          fee={"0%"} />,
        <CreditCard 
          name={"Gold credit card"} 
          rewards={"Jumpstart your financial fitness. 60 day introductory balance transfer offer, save on interest, and get your free monthly credit score"}
          img={"https://s3-us-west-1.amazonaws.com/finserv-images/GoldCardImage%402x.png"}
          apr={"0%"} 
          fee={"0%"} />,
        <CreditCard 
          name={"Black credit card"} 
          rewards={"Preimum travel & dining rewards. Earn 2x points on travel and dining at restaurants."}
          img={"https://s3-us-west-1.amazonaws.com/finserv-images/BlackCardImage%402x.png"}
          apr={"16.99-23.99%"} 
          fee={"0% intro annual fee for the first year, after that $95"} />
      ]
    }
  }
  
  loadAdditionalCards() {

    const additionalCards = [ <CreditCard 
            name={"Super Basic credit card"}
            rewards={"There are absolutely no rewards for this card"}
            img={"https://s3-us-west-1.amazonaws.com/finserv-images/SilverCardImage%402x.png"} 
            apr={"0%"}
            fee={"0%"} />,
        <CreditCard 
            name={"Secure credit card"}
            rewards={"Your reward is peace at mind."}
            img={"https://s3-us-west-1.amazonaws.com/finserv-images/BlackCardImage%402x.png"}
            apr={"0%"}
            fee={"0%"} />
    ]

    let updatedCardArray = [...this.state.data, ...additionalCards];
    this.setState({ data: updatedCardArray });

    const targetElem = document.getElementById('additional-cards-button');
    targetElem.style.display = 'none';
  }

  render() {
    return(
      <div className="grid-x grid-margin-x">
        <div className="cell large-10 large-offset-1">
          <div id="card-options" className="">
            <h1 className="gotham-light">Credit Cards</h1>
            { this.state.data }
            <br /><br />
          </div>
          <div className="grid-x grid-margin-x additional-cards-div">
            <div className="cell medium-4 medium-offset-4 vertical-algin">
              <button type="button" id="additional-cards-button" className="button hollow" onClick={this.loadAdditionalCards.bind(this)}>ADDITIONAL CARDS</button><br />
            </div>
          </div>
        </div>
      </div>
    );
  }
};