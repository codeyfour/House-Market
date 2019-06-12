pragma solidity >=0.4.22 <0.6.0;

import "./ERC20.sol";

contract TokenThree  is ERC20 {
    string public name = "TokenThree";
    string public symbol = "T3";
    uint8 public decimals = 2;
    uint public INITIAL_SUPPLYTokenThree = 12000;

    constructor() public {
        _mint(msg.sender, INITIAL_SUPPLYTokenThree);
    }

}