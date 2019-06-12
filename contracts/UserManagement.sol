pragma solidity >=0.4.22 <0.6.0;  



contract UserManagement {

//*******************************************************************//
//------------------ GLOBALS------------------- -------------------//
//*******************************************************************//

    //blockchain specific data type.  Its a wallet address.
    address payable contractOwner; //Owner of contract


//*******************************************************************//
//------------------ CONSTRUCTOR------------------- -------------------//
//*******************************************************************//
    constructor() public {
        contractOwner = msg.sender; //creates a global of the contract creator etherium address
    }

//*******************************************************************//
//------------------ DATABASES------------------- -------------------//
//*******************************************************************//

    struct Landlord { 
        uint256 uID;
        address user;
        bool drivingLicenceVerified;
        bool addressVerified;
        bool contactNumberVerified;
        bool nameVerified;
        bool KnowYourCustomerVerified;
        bool active;
    }

    struct Renter {
        uint256 uID;
        address user;
        bool drivingLicenceVerified;
        bool addressVerified;
        bool contactNumberVerified;
        bool nameVerified;
        bool KnowYourCustomerVerified;
        bool active;
    }

    struct Buyer {
        uint256 uID;
        address user;
        bool drivingLicenceVerified;
        bool addressVerified;
        bool contactNumberVerified;
        bool nameVerified;
        bool KnowYourCustomerVerified;
        bool active;
    }

    struct BuyerAsset {
        uint256 uID;
        address user;
        bool drivingLicenceVerified;
        bool addressVerified;
        bool contactNumberVerified;
        bool nameVerified;
        bool KnowYourCustomerVerified;
        bool active;
        uint256 ownershipPercentile;
    }

    struct Seller {
        uint256 uID;
        address user;
        bool drivingLicenceVerified;
        bool addressVerified;
        bool contactNumberVerified;
        bool nameVerified;
        bool KnowYourCustomerVerified;
        bool active;
    }

    struct SellerAsset {
        uint256 uID;
        address user;
        bool drivingLicenceVerified;
        bool addressVerified;
        bool contactNumberVerified;
        bool nameVerified;
        bool KnowYourCustomerVerified;
        bool active;
        uint256 ownershipPercentile;
    }

//*******************************************************************//
//------------------ MAPPINGS----------------------------------------//
//*******************************************************************//
    mapping(address => Landlord) Landlords;
    mapping(address => Renter) Renters;
    mapping(address => Buyer) Buyers;
    mapping(address => BuyerAsset) BuyerAssets;
    mapping(address => Seller) Sellers;
    mapping(address => SellerAsset) SellerAssets;

//*******************************************************************//
//------------------ ARRAYS------------------------------------------//
//*******************************************************************//
    Landlord[] LandlordArray;
    Renter[] RenterArray;
    Buyer[] BuyerArray;
    BuyerAsset[] BuyerAssetArray;
    Seller[] SellerArray;
    SellerAsset[] SellerAssetArray;

//*******************************************************************//
//------------------ FUNCTIONS-Adding to database--------------------//
//*******************************************************************//
    function addLandlord(uint256 _uID,address _user,bool _drivingLicenceVerified,bool _addressVerified,bool _contactNumberVerified, bool _nameVerified, 
                        bool _KnowYourCustomerVerified,bool _active) public {

    Landlords[msg.sender].uID = _uID;
    Landlords[msg.sender].user = _user;
    Landlords[msg.sender].drivingLicenceVerified = _drivingLicenceVerified;
    Landlords[msg.sender].addressVerified = _addressVerified;
    Landlords[msg.sender].contactNumberVerified = _contactNumberVerified;
    Landlords[msg.sender].nameVerified = _nameVerified;
    Landlords[msg.sender].KnowYourCustomerVerified = _KnowYourCustomerVerified;
    }

    function addRenter(uint256 _uID,address _user,bool _drivingLicenceVerified,bool _addressVerified,bool _contactNumberVerified, bool _nameVerified,
                        bool _KnowYourCustomerVerified,bool _active) public {

        Renters[msg.sender].uID = _uID;
        Renters[msg.sender].user = _user;
        Renters[msg.sender].drivingLicenceVerified = _drivingLicenceVerified;
        Renters[msg.sender].addressVerified = _addressVerified;
        Renters[msg.sender].contactNumberVerified = _contactNumberVerified;
        Renters[msg.sender].nameVerified = _nameVerified;
        Renters[msg.sender].KnowYourCustomerVerified = _KnowYourCustomerVerified;
        Renters[msg.sender].active = _active;

    }

    function addBuyer(uint256 _uID,address _user,bool _drivingLicenceVerified,bool _addressVerified,bool _contactNumberVerified, bool _nameVerified, 
                        bool _KnowYourCustomerVerified,bool _active) public {
        Buyers[msg.sender].uID = _uID;
        Buyers[msg.sender].user = _user;
        Buyers[msg.sender].drivingLicenceVerified = _drivingLicenceVerified;
        Buyers[msg.sender].addressVerified = _addressVerified;
        Buyers[msg.sender].contactNumberVerified = _contactNumberVerified;
        Buyers[msg.sender].nameVerified = _nameVerified;
        Buyers[msg.sender].KnowYourCustomerVerified = _KnowYourCustomerVerified;
        Buyers[msg.sender].active = _active;

    }

    function addBuyerAsset(uint256 _uID,address _user,bool _drivingLicenceVerified,bool _addressVerified,bool _contactNumberVerified, bool _nameVerified, 
                        bool _KnowYourCustomerVerified,bool _active) public {

        BuyerAssets[msg.sender].uID = _uID;
        BuyerAssets[msg.sender].user = _user;
        BuyerAssets[msg.sender].drivingLicenceVerified = _drivingLicenceVerified;
        BuyerAssets[msg.sender].addressVerified = _addressVerified;
        BuyerAssets[msg.sender].contactNumberVerified = _contactNumberVerified;
        BuyerAssets[msg.sender].nameVerified = _nameVerified;
        BuyerAssets[msg.sender].KnowYourCustomerVerified = _KnowYourCustomerVerified;
        BuyerAssets[msg.sender].active = _active;
        BuyerAssets[msg.sender].ownershipPercentile = 0;

    }

    function addSeller(uint256 _uID,address _user,bool _drivingLicenceVerified,bool _addressVerified,bool _contactNumberVerified, bool _nameVerified,
                        bool _KnowYourCustomerVerified,bool _active) public {
        
        Sellers[msg.sender].uID = _uID;
        Sellers[msg.sender].user = _user;
        Sellers[msg.sender].drivingLicenceVerified = _drivingLicenceVerified;
        Sellers[msg.sender].addressVerified = _addressVerified;
        Sellers[msg.sender].contactNumberVerified = _contactNumberVerified;
        Sellers[msg.sender].nameVerified = _nameVerified;
        Sellers[msg.sender].KnowYourCustomerVerified = _KnowYourCustomerVerified;
        Sellers[msg.sender].active = _active;

    }

    function addSellerAsset(uint256 _uID,address _user,bool _drivingLicenceVerified,bool _addressVerified,bool _contactNumberVerified, bool _nameVerified,
                        bool _KnowYourCustomerVerified,bool _active) public {
        
        SellerAssets[msg.sender].uID = _uID;
        SellerAssets[msg.sender].user = _user;
        SellerAssets[msg.sender].drivingLicenceVerified = _drivingLicenceVerified;
        SellerAssets[msg.sender].addressVerified = _addressVerified;
        SellerAssets[msg.sender].contactNumberVerified = _contactNumberVerified;
        SellerAssets[msg.sender].nameVerified = _nameVerified;
        SellerAssets[msg.sender].KnowYourCustomerVerified = _KnowYourCustomerVerified;
        SellerAssets[msg.sender].active = _active; 
        SellerAssets[msg.sender].ownershipPercentile = 0;

    }

//*******************************************************************//
//------------------ FUNCTIONS-removing from database----------------//
//*******************************************************************//

    function removeLandlord(address _user) public {
      Landlords[_user].active = false;

    }

    function removeRenter(address _user) public {
      Renters[_user].active = false;

    }

    function removeBuyer(address _user) public {
      Buyers[_user].active = false;

    }

    function removeBuyerAsset(address _user) public {
      BuyerAssets[_user].active = false;

    }

    function removeSeller(address _user) public {
      Sellers[_user].active = false;

    }

    function removeSellerAsset(address _user) public {
      SellerAssets[_user].active = false;

    }

//*******************************************************************//
//------------------ FUNCTIONS-get from database---------------------//
//*******************************************************************//

    function getLandlord(address _user) public view returns (uint256, address, bool, bool, bool, bool, bool, bool){
        uint256 _userTemp = Landlords[_user].uID;
        address _addressTemp = Landlords[_user].user;
        bool _drivingLicenceVerifiedTemp = Landlords[_user].drivingLicenceVerified;
        bool _addressVerifiedTemp = Landlords[_user].addressVerified; 
        bool _contactNumberVerifiedTemp = Landlords[_user].contactNumberVerified;
        bool _nameVerifiedTemp = Landlords[_user].nameVerified;
        bool _KnowYourCustomerVerifiedTemp = Landlords[_user].KnowYourCustomerVerified;
        bool _activeTemp = Landlords[_user].active;

        return (_userTemp,_addressTemp,_drivingLicenceVerifiedTemp,_addressVerifiedTemp,_contactNumberVerifiedTemp,_nameVerifiedTemp,_KnowYourCustomerVerifiedTemp,_activeTemp);

    }

    function getRenter(address _user) public view  returns (uint256, address, bool, bool, bool, bool, bool, bool) {
        uint256 _userTemp = Renters[_user].uID;
        address _addressTemp = Renters[_user].user;
        bool _drivingLicenceVerifiedTemp = Renters[_user].drivingLicenceVerified;
        bool _addressVerifiedTemp = Renters[_user].addressVerified;
        bool _contactNumberVerifiedTemp = Renters[_user].contactNumberVerified;
        bool _nameVerifiedTemp = Renters[_user].nameVerified;
        bool _KnowYourCustomerVerifiedTemp = Renters[_user].KnowYourCustomerVerified;
        bool _activeTemp = Renters[_user].active;

        return (_userTemp,_addressTemp,_drivingLicenceVerifiedTemp,_addressVerifiedTemp,_contactNumberVerifiedTemp,_nameVerifiedTemp,_KnowYourCustomerVerifiedTemp,_activeTemp);

    }

    function getBuyer(address _user) public view  returns (uint256, address, bool, bool, bool, bool, bool, bool) {
        uint256 _userTemp = Buyers[_user].uID;
        address _addressTemp = Buyers[_user].user;
        bool _drivingLicenceVerifiedTemp = Buyers[_user].drivingLicenceVerified;
        bool _addressVerifiedTemp = Buyers[_user].addressVerified;
        bool _contactNumberVerifiedTemp = Buyers[_user].contactNumberVerified;
        bool _nameVerifiedTemp = Buyers[_user].nameVerified;
        bool _KnowYourCustomerVerifiedTemp = Buyers[_user].KnowYourCustomerVerified;
        bool _activeTemp = Buyers[_user].active;

        return (_userTemp,_addressTemp,_drivingLicenceVerifiedTemp,_addressVerifiedTemp,_contactNumberVerifiedTemp,_nameVerifiedTemp,_KnowYourCustomerVerifiedTemp,_activeTemp);
    }

    function getBuyerAsset(address _user) public view  returns (uint256, address, bool, bool, bool, bool, bool, bool,uint256) {
        uint256 _userTemp = BuyerAssets[_user].uID;
        address _addressTemp = BuyerAssets[_user].user;
        bool _drivingLicenceVerifiedTemp = BuyerAssets[_user].drivingLicenceVerified;
        bool _addressVerifiedTemp = BuyerAssets[_user].addressVerified;
        bool _contactNumberVerifiedTemp = BuyerAssets[_user].contactNumberVerified;
        bool _nameVerifiedTemp = BuyerAssets[_user].nameVerified;
        bool _KnowYourCustomerVerifiedTemp = BuyerAssets[_user].KnowYourCustomerVerified;
        bool _activeTemp = BuyerAssets[_user].active;
        uint256 _asset = BuyerAssets[_user].ownershipPercentile;

        return (_userTemp,_addressTemp,_drivingLicenceVerifiedTemp,_addressVerifiedTemp,_contactNumberVerifiedTemp,_nameVerifiedTemp,_KnowYourCustomerVerifiedTemp,_activeTemp,_asset);
    }

    function getSeller(address _user) public view  returns (uint256, address, bool, bool, bool, bool, bool, bool) {
        uint256 _userTemp = BuyerAssets[_user].uID;
        address _addressTemp = BuyerAssets[_user].user;
        bool _drivingLicenceVerifiedTemp = BuyerAssets[_user].drivingLicenceVerified;
        bool _addressVerifiedTemp = BuyerAssets[_user].addressVerified;
        bool _contactNumberVerifiedTemp = BuyerAssets[_user].contactNumberVerified;
        bool _nameVerifiedTemp = BuyerAssets[_user].nameVerified;
        bool _KnowYourCustomerVerifiedTemp = BuyerAssets[_user].KnowYourCustomerVerified;
        bool _activeTemp = BuyerAssets[_user].active;

        return (_userTemp,_addressTemp,_drivingLicenceVerifiedTemp,_addressVerifiedTemp,_contactNumberVerifiedTemp,_nameVerifiedTemp,_KnowYourCustomerVerifiedTemp,_activeTemp);
    }

    function getSellerAsset(address _user) public view  returns (uint256, address, bool, bool, bool, bool, bool, bool, uint256) {
        
        uint256 _userTemp = SellerAssets[_user].uID;
        address _addressTemp = SellerAssets[_user].user;
        bool _drivingLicenceVerifiedTemp = SellerAssets[_user].drivingLicenceVerified;
        bool _addressVerifiedTemp = SellerAssets[_user].addressVerified;
        bool _contactNumberVerifiedTemp = SellerAssets[_user].contactNumberVerified;
        bool _nameVerifiedTemp = SellerAssets[_user].nameVerified;
        bool _KnowYourCustomerVerifiedTemp = SellerAssets[_user].KnowYourCustomerVerified;
        bool _activeTemp = SellerAssets[_user].active;
        uint256 _asset = SellerAssets[_user].ownershipPercentile;

        return (_userTemp,_addressTemp,_drivingLicenceVerifiedTemp,_addressVerifiedTemp,_contactNumberVerifiedTemp,_nameVerifiedTemp,_KnowYourCustomerVerifiedTemp,_activeTemp,_asset);
    }

//*******************************************************************//
//------------------ Asset-accounts updates ---------------------//
//*******************************************************************//

    function updateBuyerAssetPercent(address _user, uint256 _assetUpdate) public {
    
        BuyerAssets[_user].ownershipPercentile = _assetUpdate;

    }

    function updateSellerAssetPercent(address _user, uint256 _assetUpdate) public {

        SellerAssets[_user].ownershipPercentile = _assetUpdate;
    }

//*******************************************************************//
//------------------ KYC updates ---------------------//
//*******************************************************************//
//Know your Customer Verify
//Landlords
    function KYK_Landlord_drivingLicenceVerified(address _user, bool update) public {

        Landlords[_user].drivingLicenceVerified = update;
    }

    function KYK_Landlord_addressVerified(address _user, bool update) public {

        Landlords[_user].addressVerified = update;
    }

    function KYK_Landlord_contactNumberVerified(address _user, bool update) public {

        Landlords[_user].contactNumberVerified = update;
    }

    function KYK_Landlord_nameVerified(address _user, bool update) public {

        Landlords[_user].nameVerified = update;
    }

    function KYK_Landlord_KnowYourCustomerVerified(address _user, bool update) public {

        Landlords[_user].KnowYourCustomerVerified = update;
    }

//Renters

    function KYK_Renters_drivingLicenceVerified(address _user, bool update) public {

        Renters[_user].drivingLicenceVerified  = update;
    }

    function KYK_Renters_addressVerified(address _user, bool update) public {

        Renters[_user].addressVerified = update;
    }

    function KYK_Renters_contactNumberVerified(address _user, bool update) public {

        Renters[_user].contactNumberVerified  = update;
    }

    function KYK_Renters_nameVerified(address _user, bool update) public {

        Renters[_user].nameVerified  = update;
    }

    function KYK_Renters_KnowYourCustomerVerified(address _user, bool update) public {

        Renters[_user].KnowYourCustomerVerified = update;
    }

//Buyer

    function KYK_Buyers_drivingLicenceVerified(address _user, bool update) public {

        Buyers[_user].drivingLicenceVerified  = update;
    }

    function KYK_Buyers_addressVerified(address _user, bool update) public {

        Buyers[_user].addressVerified = update;
    }

    function KYK_Buyers_contactNumberVerified(address _user, bool update) public {

        Buyers[_user].contactNumberVerified  = update;
    }

    function KYK_Buyers_nameVerified(address _user, bool update) public {

        Buyers[_user].nameVerified  = update;
    }

    function KYK_Buyers_KnowYourCustomerVerified(address _user, bool update) public {

        Buyers[_user].KnowYourCustomerVerified = update;
    }

//BuyerAsset

    function KYK_BuyerAssets_drivingLicenceVerified(address _user, bool update) public {

        BuyerAssets[_user].drivingLicenceVerified  = update;
    }

    function KYK_BuyerAssets_addressVerified(address _user, bool update) public {

        BuyerAssets[_user].addressVerified = update;
    }

    function KYK_BuyerAssets_contactNumberVerified(address _user, bool update) public {

        BuyerAssets[_user].contactNumberVerified  = update;
    }

    function KYK_BuyerAssets_nameVerified(address _user, bool update) public {

        BuyerAssets[_user].nameVerified  = update;
    }

    function KYK_BuyerAssets_KnowYourCustomerVerified(address _user, bool update) public {

        BuyerAssets[_user].KnowYourCustomerVerified = update;
    }

//Sellers

    function KYK_Sellers_drivingLicenceVerified(address _user, bool update) public {

        Sellers[_user].drivingLicenceVerified  = update;
    }

    function KYK_Sellers_addressVerified(address _user, bool update) public {

        Sellers[_user].addressVerified = update;
    }

    function KYK_Sellers_contactNumberVerified(address _user, bool update) public {

        Sellers[_user].contactNumberVerified  = update;
    }

    function KYK_Sellers_nameVerified(address _user, bool update) public {

        Sellers[_user].nameVerified  = update;
    }

    function KYK_Sellers_KnowYourCustomerVerified(address _user, bool update) public {

        Sellers[_user].KnowYourCustomerVerified = update;
    }

//SellerAssets

    function KYK_SellerAssets_drivingLicenceVerified(address _user, bool update) public {

        SellerAssets[_user].drivingLicenceVerified  = update;
    }

    function KYK_SellerAssets_addressVerified(address _user, bool update) public {

        SellerAssets[_user].addressVerified = update;
    }

    function KYK_SellerAssets_contactNumberVerified(address _user, bool update) public {

        SellerAssets[_user].contactNumberVerified  = update;
    }

    function KYK_SellerAssets_nameVerified(address _user, bool update) public {

        SellerAssets[_user].nameVerified  = update;
    }

    function KYK_SellerAssets_KnowYourCustomerVerified(address _user, bool update) public {

        SellerAssets[_user].KnowYourCustomerVerified = update;
    }


}