// SPDX-License-Identifier:MIT
pragma solidity ^0.8.7;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/IERC20.sol";
import "MyToken.sol";

contract myToken{
    address token = 0xB661d49a3dA559c96Bb34Fca62784Cd869566FcE;

    address payable public owner;
    
    // uint256 public balanceContract;

    constructor(){
        owner = payable(msg.sender);
    }

    //This modifier provides access to only the owner of the smart contarct.
    modifier onlyOwner {
    require(msg.sender == owner, "Only owner can call it");
    _;
    }

    //This function transfers ERC20 token from user's account to this contract and assign the slab according to the balance of that token in smart contract.
    function transfer(uint _amount) public payable{
        require(getContractBalance()<=1500,"Maximum Limit Reached");
        IERC20(token).approve(msg.sender, _amount);
        IERC20(token).transferFrom(msg.sender,address(this), _amount);
        // balanceContract = IERC20(token).balanceOf(address(this));

    }

    // This function allow you to see how many tokens have the smart contract 
    function getContractBalance() public onlyOwner view returns(uint){
    return IERC20(token).balanceOf(address(this));
    }

    //Withdraw function for allowing only owner to take out the funds out of contract.
    function withdraw(uint256 _amount) public onlyOwner{
        require(getContractBalance() > 0);
        IERC20(token).transfer(msg.sender, _amount);
    }

    //This function gets the current slab according to hte balance of token in smart contract.
    function getSlab() public view returns(string memory slab){
         if(getContractBalance()/(10**18) < 500){
            slab = "Slab4";
            return slab;
        }
         else if(getContractBalance()/(10**18) >= 500 && getContractBalance()/(10**18) < 900){
            slab = "Slab3";
            return slab;
        }
        else if(getContractBalance()/(10**18) >= 900 && getContractBalance()/(10**18) < 1200){
            slab = "Slab2";
            return slab;
        }
        else if(getContractBalance()/(10**18) >= 1200 && getContractBalance()/(10**18) < 1400){
            slab = "Slab1";
            return slab;
        }
        else if(getContractBalance()/(10**18) >= 1400 && getContractBalance()/(10**18) < 1500){
            slab = "Slab0";
            return slab;
        }
    }
}


//Contract Address = contract 0xe5d130fc57489601874a8c941a2be05749d51ec9
