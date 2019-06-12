pragma solidity >=0.4.22 <0.6.0;

import "./ERC20.sol";

contract TokenTwo  is ERC20 {
    string public name = "TokenTwo";
    string public symbol = "T2";
    uint8 public decimals = 2;
    uint public INITIAL_SUPPLYTokenTwo = 12000;

    constructor() public {
        _mint(msg.sender, INITIAL_SUPPLYTokenTwo);
    }

}