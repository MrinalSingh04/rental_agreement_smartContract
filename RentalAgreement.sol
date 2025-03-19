// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract RentalAgreement {
    address public landlord;
    address public tenant;
    uint256 public rentAmount;
    uint256 public securityDeposit;
    uint256 public leaseEnd;
    uint256 public lastPaid;
    uint256 public gracePeriod = 7 days;

    enum RentalStatus { Vacant, Occupied }
    RentalStatus public status;

    event Rented(address indexed tenant, uint256 leaseEnd);
    event RentPaid(address indexed tenant, uint256 amount, uint256 nextDueDate);
    event Evicted(address indexed tenant);

    modifier onlyLandlord() {
        require(msg.sender == landlord, "Only landlord can perform this action");
        _;
    }

    modifier onlyTenant() {
        require(msg.sender == tenant, "Only tenant can perform this action");
        _;
    }

    constructor(uint256 _rentAmount, uint256 _securityDeposit, uint256 _leaseDuration) {
        landlord = msg.sender;
        rentAmount = _rentAmount;
        securityDeposit = _securityDeposit;
        leaseEnd = block.timestamp + _leaseDuration;
        status = RentalStatus.Vacant;
    }

    function rent() external payable {
        require(status == RentalStatus.Vacant, "Property already rented");
        require(msg.value == rentAmount + securityDeposit, "Incorrect payment amount");

        tenant = msg.sender;
        lastPaid = block.timestamp;
        status = RentalStatus.Occupied;

        emit Rented(tenant, leaseEnd);
    }

    function payRent() external payable onlyTenant {
        require(block.timestamp < leaseEnd, "Lease has ended");
        require(msg.value == rentAmount, "Incorrect rent amount");

        lastPaid = block.timestamp;
        emit RentPaid(tenant, msg.value, lastPaid + 30 days);
    }

    function evict() external onlyLandlord {
        require(status == RentalStatus.Occupied, "No active tenant");
        require(block.timestamp > lastPaid + 30 days + gracePeriod, "Grace period not exceeded");

        payable(tenant).transfer(securityDeposit);
        tenant = address(0);
        status = RentalStatus.Vacant;

        emit Evicted(tenant);
    }

    function withdrawRent() external onlyLandlord {
        payable(landlord).transfer(address(this).balance);
    }
}
