// SPDX-License-Identifier: MIT

pragma solidity 0.8.11;

import "@openzeppelin/contracts/utils/Address.sol";

contract Puzzle {
    string public a = "Playground labs";
    uint256 private immutable password;
    address public owner;

    constructor(uint256 _password) payable {
        require(msg.value > 0, "You forgot the prize");
        password = _password;
    }

    function foo(uint256 _password, address _address, bytes memory _bytes) external {
        require(_password == password, "Incorrect password");
        Address.functionDelegateCall(_address, _bytes);
    }

    function collectPrize() external {
        require(msg.sender == owner, "Only owner");
        Address.sendValue(payable(msg.sender), address(this).balance);
    }
}
