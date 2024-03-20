// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {CPTH} from "./CPTH.sol";
import {NFTHouse} from "./NFTHouse.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/Math.sol";

contract HouseRenting is Ownable {
    using Math for uint256;
    // ERC20 token used for renting
    CPTH public cpthToken;

    // ERC721 token representing houses
    NFTHouse public nftHouse;

    // Mapping from house token ID to rental information
    mapping(uint256 => Rental) public rentals;

    // Minimum rental period in seconds (90 days)
    uint256 public constant MIN_RENTAL_PERIOD = 90 days;

    // Event emitted when a house is rented
    event HouseRented(
        address indexed renter,
        uint256 indexed houseId,
        uint256 startTime,
        uint256 endTime
    );

    // Event emitted when a house rental is ended
    event RentalEnded(uint256 indexed houseId);

    struct Rental {
        uint256 startTime;
        uint256 endTime;
    }

    constructor(
        address _tokenAddress,
        address _houseTokenAddress,
        address initialOwner
    ) Ownable(initialOwner) {
        cpthToken = CPTH(_tokenAddress);
        nftHouse = NFTHouse(_houseTokenAddress);
    }

    // Function to rent a house
    function rentHouse(uint256 _houseId) external {
        require(
            nftHouse.ownerOf(_houseId) == address(this),
            "HouseRenting: House not available for rent"
        );
        require(
            rentals[_houseId].endTime < block.timestamp,
            "HouseRenting: House already rented"
        );

        // Transfer ownership of the house to the renter
        nftHouse.safeTransferFrom(address(this), msg.sender, _houseId);

        // // Calculate rental end time (90 days from now)
        // uint256 endTime = block.timestamp.add(MIN_RENTAL_PERIOD);

        // // Update rental information
        // rentals[_houseId] = Rental(block.timestamp, endTime);

        // emit HouseRented(msg.sender, _houseId, block.timestamp, endTime);
    }

    // Function to end rental and burn the house token
    function endRental(uint256 _houseId) external {
        require(
            rentals[_houseId].endTime > 0,
            "HouseRenting: Rental for this house not found"
        );
        require(
            rentals[_houseId].endTime <= block.timestamp,
            "HouseRenting: Rental period not ended yet"
        );

        // Burn the house token
        nftHouse.burn(_houseId);

        // Clear rental information
        delete rentals[_houseId];

        emit RentalEnded(_houseId);
    }

    // Owner function to withdraw ERC20 tokens accidentally sent to this contract
    function withdrawTokens(
        address _token,
        address _to,
        uint256 _amount
    ) external onlyOwner {
        CPTH(_token).transfer(_to, _amount);
    }

    // Owner function to change the ERC20 token used for renting
    function setToken(address _tokenAddress) external onlyOwner {
        cpthToken = CPTH(_tokenAddress);
    }

    // Owner function to change the ERC721 house token
    function setHouseToken(address _houseTokenAddress) external onlyOwner {
        nftHouse = NFTHouse(_houseTokenAddress);
    }
}
