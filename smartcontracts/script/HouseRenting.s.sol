// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script, console} from "forge-std/Script.sol";
import {HouseRenting} from "../src/HouseRenting.sol";

contract HouseRentingScript is Script {
    HouseRenting houseRenting;

    function setUp() public {}

    function run() public {
        vm.startBroadcast(
            0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
        );

        vm.stopBroadcast();
    }
}
