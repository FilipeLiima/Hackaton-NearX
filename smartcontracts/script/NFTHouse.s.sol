// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script, console} from "forge-std/Script.sol";
import {NFTHouse} from "../src/NFTHouse.sol";

contract NFTHomeScript is Script {
    NFTHouse nftHouse;

    function setUp() public {}

    function run() public {
        vm.startBroadcast(
            0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
        );

        nftHouse = new NFTHouse(msg.sender);

        vm.stopBroadcast();
    }
}
