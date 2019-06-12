pragma solidity >=0.4.22 <0.6.0;

//Smart contract for Property Market Place


contract MarketPlace {

//*******************************************************************//
//------------------ DATABASES------------------- -------------------//
//*******************************************************************//
    struct HouseSale {
        uint256 uID;
        address owner;
        bytes32 fullAddress;
        bytes32 pictureURL;
        bytes32 dimensions;
        uint256 roomNo;
        bool detached;
        bool semiDetached;
        bool garden;
        uint256 price;
        uint256 dateOnSale;
        bool onwardChain;
        bytes32 shortDescription;
        bytes32 longDescription;
        bool sold;
        bool isDeleted;
    }

    struct HouseRent {
        uint256 uID;
        address owner;
        bytes32 fullAddress;
        bytes32 pictureURL;
        bytes32 dimensions;
        uint256 roomNo;
        bool detached;
        bool semiDetached;
        bool garden;
        uint256 price;
        uint256 dateOnSale;
        bool onwardChain;
        bytes32 shortDescription;
        bytes32 longDescription;
        bool sold;
        bool isDeleted;
    }

    //to keep track of pictures of for sales
    struct PictureDBSale {
        uint256 uID;
        address owner;
        bytes32 serverAddress;
        bytes32 picture2;
        bytes32 picture3;
        bytes32 picture4;
        bytes32 picture5;
        bytes32 picture6;
        bytes32 picture7;
        bytes32 picture8;
        bytes32 picture9;
        bytes32 picture10;
        bytes32 picture11;
        bytes32 picture12;
        bytes32 picture13;
        bytes32 picture14;
        bytes32 picture15;
        bool isDeleted;
    }

    //to keep track of pictures of for rents
    struct PictureDBRent {
        uint256 uID;
        address owner;
        bytes32 serverAddress;
        bytes32 picture2;
        bytes32 picture3;
        bytes32 picture4;
        bytes32 picture5;
        bytes32 picture6;
        bytes32 picture7;
        bytes32 picture8;
        bytes32 picture9;
        bytes32 picture10;
        bytes32 picture11;
        bytes32 picture12;
        bytes32 picture13;
        bytes32 picture14;
        bytes32 picture15;
        bool isDeleted;
    }
//*******************************************************************//
//------------------ MAPPINGS------------------- -------------------//
//*******************************************************************//
    mapping(address => HouseSale) HouseSales;
    mapping(address => HouseRent) HouseRents;
    mapping(address => PictureDBSale) PictureDBSales;
    mapping(address => PictureDBRent) PictureDBRents;

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
//------------------ ADD PROPERTIES FOR SALE----------------- -------//
//*******************************************************************//
    function addforSale(uint256 _uID,address _owner,bytes32 _fullAddress,bytes32 _pictureURL,bytes32 _dimensions,uint256 _roomNo,bool _detached,bool _semiDetached,bool _garden,uint256 _price,
                        uint256 _dateOnSale,bool _onwardChain,bytes32 _shortDescription,bytes32 _longDescription,bool _sold) public payable returns (bool) {
            HouseSales[msg.sender].uID = _uID;
            HouseSales[msg.sender].owner = _owner;
            HouseSales[msg.sender].fullAddress = _fullAddress;
            HouseSales[msg.sender].pictureURL = _pictureURL;
            HouseSales[msg.sender].dimensions =_dimensions ;
            HouseSales[msg.sender].roomNo = _roomNo;
            HouseSales[msg.sender].detached = _detached;
            HouseSales[msg.sender].semiDetached = _semiDetached;
            HouseSales[msg.sender].garden = _garden;
            HouseSales[msg.sender].price = _price;
            HouseSales[msg.sender].dateOnSale = _dateOnSale;
            HouseSales[msg.sender].onwardChain = _onwardChain;
            HouseSales[msg.sender].shortDescription = _shortDescription;
            HouseSales[msg.sender].longDescription = _longDescription;
            HouseSales[msg.sender].sold = _sold;
            HouseSales[msg.sender].isDeleted = false;
        
        }
//*******************************************************************//
//------------------ ADD PROPERTIES FOR RENT-------------------------//
//*******************************************************************//
    function addforRent(uint256 _uID,address _owner,bytes32 _fullAddress,bytes32 _pictureURL,bytes32 _dimensions,uint256 _roomNo,bool _detached,bool _semiDetached,bool _garden,uint256 _price,
                        uint256 _dateOnSale,bool _onwardChain,bytes32 _shortDescription,bytes32 _longDescription,bool _sold) public payable returns (bool) {
            HouseRents[msg.sender].uID = _uID;
            HouseRents[msg.sender].owner = _owner;
            HouseRents[msg.sender].fullAddress = _fullAddress;
            HouseRents[msg.sender].pictureURL = _pictureURL;
            HouseRents[msg.sender].dimensions =_dimensions ;
            HouseRents[msg.sender].roomNo = _roomNo;
            HouseRents[msg.sender].detached = _detached;
            HouseRents[msg.sender].semiDetached = _semiDetached;
            HouseRents[msg.sender].garden = _garden;
            HouseRents[msg.sender].price = _price;
            HouseRents[msg.sender].dateOnSale = _dateOnSale;
            HouseRents[msg.sender].onwardChain = _onwardChain;
            HouseRents[msg.sender].shortDescription = _shortDescription;
            HouseRents[msg.sender].longDescription = _longDescription;
            HouseRents[msg.sender].sold = _sold;
            HouseSales[msg.sender].isDeleted = false;
        }
//*******************************************************************//
//------------------ UPDATE PROPERTIES STATS-------------------------//
//*******************************************************************//
    function markSold(bool _sold, uint256 _price) public payable returns (bool) {
        HouseSales[msg.sender].price = _price;
        HouseSales[msg.sender].sold = _sold;
    }

    function markRented(bool _sold, uint256 _price) public payable returns (bool) {
        HouseRents[msg.sender].price = _price;
        HouseRents[msg.sender].sold = _sold;
    }

    function updateSaleDesc(bytes32 _shortDescription, bytes32 _longDescription) public payable returns (bool) {
            HouseSales[msg.sender].shortDescription = _shortDescription;
            HouseSales[msg.sender].longDescription = _longDescription;
    }

    function deleteForSale () public payable returns (bool) {
        HouseSales[msg.sender].isDeleted = true;
    }

    function deleteForRent () public payable returns (bool) {
        HouseRents[msg.sender].isDeleted = true;
    }

    function updateSalePrice (uint256 _price) public payable returns (bool) {
        HouseSales[msg.sender].price = _price;
    }

    function updateRentPrice (uint256 _price) public payable returns (bool) {
        HouseRents[msg.sender].price = _price;
    }

    function updateSaleChain (bool _onwardChain) public payable returns (bool) {
        HouseSales[msg.sender].onwardChain = _onwardChain;
    }

    function updateRentChain (bool _onwardChain) public payable returns (bool) {
        HouseRents[msg.sender].onwardChain = _onwardChain;
    }

//*******************************************************************//
//------------------ ADD PROPERTIES PICTURES-------------------------//
//*******************************************************************//
    function addPicturesSale (uint32 _uID,bytes32 _picture2,bytes32 _picture3,bytes32 _picture4,bytes32 _picture5,bytes32 _picture6,bytes32 _picture7,bytes32 _picture8,bytes32 _picture9,
                                bytes32 _picture10,bytes32 _picture11,bytes32 _picture12,bytes32 _picture13,bytes32 _picture14,bytes32 _picture15) public payable returns (bool) {
            PictureDBSales[msg.sender].uID = _uID;
            PictureDBSales[msg.sender].owner = msg.sender;
            PictureDBSales[msg.sender].picture2 = _picture2;
            PictureDBSales[msg.sender].picture3 = _picture3;
            PictureDBSales[msg.sender].picture4 =_picture4 ;
            PictureDBSales[msg.sender].picture5 = _picture5;
            PictureDBSales[msg.sender].picture6 = _picture6;
            PictureDBSales[msg.sender].picture7 = _picture7;
            PictureDBSales[msg.sender].picture8 = _picture8;
            PictureDBSales[msg.sender].picture9 = _picture9;
            PictureDBSales[msg.sender].picture10 = _picture10;
            PictureDBSales[msg.sender].picture11 = _picture11;
            PictureDBSales[msg.sender].picture12 = _picture12;
            PictureDBSales[msg.sender].picture13 = _picture13;
            PictureDBSales[msg.sender].picture14 = _picture14;
            PictureDBSales[msg.sender].picture15 = _picture15;
        }

    function addPicturesRent (uint32 _uID,bytes32 _picture2,bytes32 _picture3,bytes32 _picture4,bytes32 _picture5,bytes32 _picture6,bytes32 _picture7,bytes32 _picture8,bytes32 _picture9,
                                bytes32 _picture10,bytes32 _picture11,bytes32 _picture12,bytes32 _picture13,bytes32 _picture14,bytes32 _picture15) public payable returns (bool) {
            PictureDBRents[msg.sender].uID = _uID;
            PictureDBRents[msg.sender].owner = msg.sender;
            PictureDBRents[msg.sender].picture2 = _picture2;
            PictureDBRents[msg.sender].picture3 = _picture3;
            PictureDBRents[msg.sender].picture4 =_picture4 ;
            PictureDBRents[msg.sender].picture5 = _picture5;
            PictureDBRents[msg.sender].picture6 = _picture6;
            PictureDBRents[msg.sender].picture7 = _picture7;
            PictureDBRents[msg.sender].picture8 = _picture8;
            PictureDBRents[msg.sender].picture9 = _picture9;
            PictureDBRents[msg.sender].picture10 = _picture10;
            PictureDBRents[msg.sender].picture11 = _picture11;
            PictureDBRents[msg.sender].picture12 = _picture12;
            PictureDBRents[msg.sender].picture13 = _picture13;
            PictureDBRents[msg.sender].picture14 = _picture14;
            PictureDBRents[msg.sender].picture15 = _picture15;
        }
//*******************************************************************//
//------------------ UPDATE PROPERTIES PICTURES-------------------------//
//*******************************************************************//
    //Updates main profile picture for sales
    function updatePicturesSale1 (bytes32 newURL) public payable returns (bool) {
        HouseSales[msg.sender].pictureURL = newURL;
    }
    //Updates main profile picture for rents
    function updatePicturesrent1 (bytes32 newURL) public payable returns (bool) {
        HouseRents[msg.sender].pictureURL = newURL;
    }

    //Updates sale picture 2
    function updatePicturesSale2 (bytes32 newURL) public payable returns (bool) {
        PictureDBSales[msg.sender].picture2 = newURL;
    }

    //Updates sale picture 3
    function updatePicturesSale3 (bytes32 newURL) public payable returns (bool) {
        PictureDBSales[msg.sender].picture3 = newURL;
    }

    //Updates sale picture 4
    function updatePicturesSale4 (bytes32 newURL) public payable returns (bool) {
        PictureDBSales[msg.sender].picture4 = newURL;
    }

    //Updates sale picture 5
    function updatePicturesSale5 (bytes32 newURL) public payable returns (bool) {
        PictureDBSales[msg.sender].picture5 = newURL;
    }

    //Updates sale picture 6
    function updatePicturesSale6 (bytes32 newURL) public payable returns (bool) {
        PictureDBSales[msg.sender].picture6 = newURL;
    }

    //Updates sale picture 7
    function updatePicturesSale7 (bytes32 newURL) public payable returns (bool) {
        PictureDBSales[msg.sender].picture7 = newURL;
    }

    //Updates sale picture 8
    function updatePicturesSale8 (bytes32 newURL) public payable returns (bool) {
        PictureDBSales[msg.sender].picture8 = newURL;
    }

    //Updates sale picture 9
    function updatePicturesSale9 (bytes32 newURL) public payable returns (bool) {
        PictureDBSales[msg.sender].picture9 = newURL;
    }

    //Updates sale picture 10
    function updatePicturesSale10 (bytes32 newURL) public payable returns (bool) {
        PictureDBSales[msg.sender].picture10 = newURL;
    }

    //Updates sale picture 11
    function updatePicturesSale11 (bytes32 newURL) public payable returns (bool) {
        PictureDBSales[msg.sender].picture11 = newURL;
    }

    //Updates sale picture 12
    function updatePicturesSale12 (bytes32 newURL) public payable returns (bool) {
        PictureDBSales[msg.sender].picture12 = newURL;
    }

    //Updates sale picture 13
    function updatePicturesSale13 (bytes32 newURL) public payable returns (bool) {
        PictureDBSales[msg.sender].picture13 = newURL;
    }

    //Updates sale picture 14
    function updatePicturesSale14 (bytes32 newURL) public payable returns (bool) {
        PictureDBSales[msg.sender].picture14 = newURL;
    }

    //Updates rent picture 15
    function updatePicturesSale15 (bytes32 newURL) public payable returns (bool) {
        PictureDBSales[msg.sender].picture15 = newURL;
    }

    //Updates rent picture 2
    function updatePicturesrent2 (bytes32 newURL) public payable returns (bool) {
        PictureDBRents[msg.sender].picture2 = newURL;
    }

    //Updates rent picture 3
    function updatePicturesrent3 (bytes32 newURL) public payable returns (bool) {
        PictureDBRents[msg.sender].picture3 = newURL;
    }

    //Updates rent picture 4
    function updatePicturesrent4 (bytes32 newURL) public payable returns (bool) {
        PictureDBRents[msg.sender].picture4 = newURL;
    }

    //Updates rent picture 5
    function updatePicturesrent5 (bytes32 newURL) public payable returns (bool) {
        PictureDBRents[msg.sender].picture5 = newURL;
    }

    //Updates rent picture 6
    function updatePicturesrent6 (bytes32 newURL) public payable returns (bool) {
        PictureDBRents[msg.sender].picture6 = newURL;
    }

    //Updates rent picture 7
    function updatePicturesrent7 (bytes32 newURL) public payable returns (bool) {
        PictureDBRents[msg.sender].picture7 = newURL;
    }

    //Updates rent picture 8
    function updatePicturesrent8 (bytes32 newURL) public payable returns (bool) {
        PictureDBRents[msg.sender].picture8 = newURL;
    }

    //Updates rent picture 9
    function updatePicturesrent9 (bytes32 newURL) public payable returns (bool) {
        PictureDBRents[msg.sender].picture9 = newURL;
    }

    //Updates rent picture 10
    function updatePicturesrent10 (bytes32 newURL) public payable returns (bool) {
        PictureDBRents[msg.sender].picture10 = newURL;
    }

    //Updates rent picture 11
    function updatePicturesrent11 (bytes32 newURL) public payable returns (bool) {
        PictureDBRents[msg.sender].picture11 = newURL;
    }

    //Updates rent picture 12
    function updatePicturesrent12 (bytes32 newURL) public payable returns (bool) {
        PictureDBRents[msg.sender].picture12 = newURL;
    }

    //Updates rent picture 13
    function updatePicturesrent13 (bytes32 newURL) public payable returns (bool) {
        PictureDBRents[msg.sender].picture13 = newURL;
    }

    //Updates rent picture 14
    function updatePicturesrent14 (bytes32 newURL) public payable returns (bool) {
        PictureDBRents[msg.sender].picture14 = newURL;
    }

    //Updates rent picture 15
    function updatePicturesrent15 (bytes32 newURL) public payable returns (bool) {
        PictureDBRents[msg.sender].picture15 = newURL;
    }

}