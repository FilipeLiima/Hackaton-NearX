// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {CPTH} from "../src/CPTH.sol";

contract CPTHTest is Test {
    CPTH public cpth;

    function setUp() public {
        cpth = new CPTH(1000);
    }

    // function test_balanceOf() public view {
    //     assertEq(cpth.balanceOf(msg.sender), 1000);
    // }

    // function test_transfer() public {
    //     uint256 initBalance = cpth.balanceOf(address(this));
    //     bool success = cpth.transfer(address(console), 100);
    //     assertTrue(success, "Transfer failed");
    //     assertEq(cpth.balanceOf(address(this)), initBalance - 100);
    //     assertEq(cpth.balanceOf(address(console)), 100);
    // }
}
