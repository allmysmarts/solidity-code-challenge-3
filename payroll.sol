// SPDX-License-Identifier: MIT

pragma solidity 0.8.11;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Address.sol";

contract Payroll is Ownable {
    using Address for address payable;
    mapping(address => bool) public onPayroll;
    
    constructor() payable {
        require(msg.value > 0, "You forgot to add ether");
    }
        
    function addToPayroll(address account) external onlyOwner {
        onPayroll[account] = true;
    }
    
    function withdrawPaycheck() external {
        require(onPayroll[msg.sender], "You are not on the payroll.");
        payable(msg.sender).sendValue(1);
        onPayroll[msg.sender] = false;
    }
}
