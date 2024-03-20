// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CPTH is ERC20 {
    constructor(uint256 initialSupply) ERC20("CryptoHome", "CPTH") {
        _mint(msg.sender, initialSupply);
    }
}
