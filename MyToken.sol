//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {

   constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) {
        _mint(msg.sender, 100000 * 10 ** 18);
    }
}

//contract address = Contract 0xB661d49a3dA559c96Bb34Fca62784Cd869566FcE
