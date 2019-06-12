pragma solidity >=0.4.22 <0.6.0;


import "./UserManagement.sol"; //UserManagement
import "./MarketPlace.sol"; //MarketPlace
import "./TokenOne.sol"; //Token 1
import "./TokenTwo.sol"; //Token 2
import "./TokenThree.sol"; //Token 3

contract Transactions is UserManagement, MarketPlace, TokenOne, TokenTwo, TokenThree  {

    function () external payable {
    }

    event housePurchased (address newOwne);
    event housePartialPurchased (address newOwne);
    event houseRented(address newOwne);
    event tokenOnePurchased(address newOwne, uint256 NumberOfTokens);
    event tokenTwoPurchased(address newOwne, uint256 NumberOfTokens);
    event tokenThreePurchased(address newOwne, uint256 NumberOfTokens);

    address payable owner;

  modifier onlyOwner() {
    require(msg.sender == owner, "You must be the owner.");
    _;
  }

  modifier verifyCaller (address _address) {
    require(msg.sender == _address, "Incorrect ID caller");
    _;
  }

  modifier paidEnoughForHouseBuy(uint _price) {
    require(msg.value >= _price, "Not Enough paid or value not sent correctly.");
      _;
  }

  modifier paidEnoughForHouseRent(uint _price) {
    require(msg.value >= _price, "Not Enough paid or value not sent correctly.");
      _;
  }

  modifier checkValueForHouseBuy(address  isOwner) {
    _;
    uint _price = HouseSales[isOwner].price;
    uint amountToReturn = msg.value - _price;
    msg.sender.transfer(amountToReturn);
  }

  modifier checkValueForHouseRent(address  isOwner) {
    uint _price = HouseRents[isOwner].price;
    uint amountToReturn = msg.value - _price;
    msg.sender.transfer(amountToReturn);
    _;
  }

  // Define a modifier that checks if an item.state of a upc is Harvested
  modifier IsOnSale(address isOwner, uint256 _uID) {
    require(HouseSales[isOwner].sold == true, "House not for sale.");
    _;
  }

    modifier IsOnRent(address isOwner, uint256 _uID) {
    require(HouseRents[isOwner].sold == true, "House not for rent.");
    _;
  }

  modifier IsSold(address isOwner, uint256 _uID) {
    require(HouseSales[isOwner].sold != true, "House is already sold.");
    _;
  }

    modifier IsRented(address  isOwner) {
    require(HouseRents[isOwner].sold != true, "House is already rented.");
    _;
  }

    modifier IsLandlord (address  isOwner) {
    require(Landlords[isOwner].user == msg.sender, "You must have the Landlord role to do this.");
    _;
  }

    modifier IsRenter(address  isOwner) {
    require(Renters[isOwner].user == msg.sender, "You must have the Renter role to do this.");
    _;
  }

    modifier IsBuyer(address  isOwner) {
    require(Buyers[isOwner].user == msg.sender, "You have buyer asset role to do this.");
    _;
  }

    modifier IsBuyerAsset(address  isOwner) {
    require(BuyerAssets[isOwner].user == msg.sender, "You have buyer asset role to do this.");
    _;
  }

    modifier IsSeller(address  isOwner) {
    require(Sellers[isOwner].user == msg.sender, "You must have the seller role to do this.");
    _;
  }

    modifier IsSellerAsset(address  isOwner) {
    require(SellerAssets[isOwner].user == msg.sender, "You have seller asset role to do this.");
    _;
  }

  function kill() public {
    if (msg.sender == owner) {
      selfdestruct(owner);
    }
  }

    function purchaseHouseFull(uint256 _uID) public payable
    //verify caller
    verifyCaller(msg.sender)
    //modifier buyer role only
    IsBuyer(msg.sender)
    //modifier house is for sale
    IsOnSale(msg.sender,_uID)
    //paidEnoughForHouseRent
    paidEnoughForHouseBuy(msg.value)
    //checkValueForHouseBuy
    checkValueForHouseBuy(msg.sender)
    {
        //update database for new owner details
        HouseSales[msg.sender].owner = msg.sender;
        HouseSales[msg.sender].sold = true;
        HouseSales[msg.sender].isDeleted = false;
        //event update
        emit housePurchased(HouseRents[msg.sender].owner);
    }

    function rentHouseFull(uint256 _uID) public payable
    //verify caller
    verifyCaller(msg.sender)
    //modifier buyer role only
    IsRenter(msg.sender)
    //modifier house is for sale
    IsRented(msg.sender)
    //check on rent
    IsOnRent(msg.sender,_uID)
    //paidEnoughForHouseRent
    paidEnoughForHouseBuy(msg.value)
    //checkValueForHouseBuy
    checkValueForHouseRent(msg.sender)
    {
        //update database for new owner details
        HouseRents[msg.sender].owner = msg.sender;
        HouseRents[msg.sender].sold = true;
        HouseRents[msg.sender].isDeleted = false;
        //event update
        emit houseRented(HouseRents[msg.sender].owner);
    }

    function purchaseHousePercentile(uint256 _uID) public payable
    //verify caller
    verifyCaller(msg.sender)
    //modifier buyer role only
    IsBuyer(msg.sender)
    //modifier house is for sale
    IsOnSale(msg.sender,_uID)
    //paidEnoughForHouseRent
    paidEnoughForHouseBuy(msg.value)
    //checkValueForHouseBuy
    checkValueForHouseBuy(msg.sender)
    {
        //update database for new owner details
        HouseSales[msg.sender].owner = msg.sender;
        HouseSales[msg.sender].sold = true;
        HouseSales[msg.sender].isDeleted = false;
        //event update
        emit housePartialPurchased(HouseRents[msg.sender].owner);
    }
        


    function setTokens(address setOwner) public payable
        onlyOwner
    {
        balances[setOwner] = INITIAL_SUPPLYTokenOne;
        balances[setOwner] = INITIAL_SUPPLYTokenTwo;
        balances[setOwner] = INITIAL_SUPPLYTokenThree;
    }

    function buyTokenOneRenter(address msg.sender, _numbertoBuy) public payable
    //verify caller
    verifyCaller(msg.sender);
    uint256 NumberOfTokens = msg.value * 10;
    uint amount = NumberOfTokens;
    {
    ERC20Interface = ERC20(contract_);
    uint256 transactionId = transactions.push(
                                    Transfer({
                                    contract_:  contract_,
                                    to_: to_,
                                    amount_: amount_,
                                    failed_: true
                                     })
                                    );


        //event update
        emit tokenOnePurchased(Buyer, NumberOfTokens)
    }


    function buyTokenTwoRenter(address msg.sender, _numbertoBuy) public payable
    //verify caller
    verifyCaller(msg.sender);
    uint256 NumberOfTokens = msg.value * 10;
    uint amount = NumberOfTokens;
    {
    ERC20Interface = ERC20(contract_);
    uint256 transactionId = transactions.push(
                                    Transfer({
                                    contract_:  contract_,
                                    to_: to_,
                                    amount_: amount_,
                                    failed_: true
                                     })
                                    );


        //event update
        emit tokenTwoPurchased(Buyer, NumberOfTokens)
    }

    function buyTokenThreeRenter(address msg.sender, _numbertoBuy) public payable
    //verify caller
    verifyCaller(msg.sender);
    uint256 NumberOfTokens = msg.value * 10;
    uint amount = NumberOfTokens;
    {
    ERC20Interface = ERC20(contract_);
    uint256 transactionId = transactions.push(
                                    Transfer({
                                    contract_:  contract_,
                                    to_: to_,
                                    amount_: amount_,
                                    failed_: true
                                     })
                                    );


        //event update
        emit tokenThreePurchased(Buyer, NumberOfTokens)
    }


}