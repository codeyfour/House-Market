pragma solidity >=0.4.22 <0.6.0;

import "./ERC20.sol";

contract TokenOne  is ERC20 {
    string public name = "TokenOne";
    string public symbol = "T1";
    uint8 public decimals = 2;
    uint public INITIAL_SUPPLYTokenOne = 12000;

    constructor() public {
        _mint(msg.sender, INITIAL_SUPPLYTokenOne);
    }

}