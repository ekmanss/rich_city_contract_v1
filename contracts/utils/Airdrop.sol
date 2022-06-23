// SPDX-License-Identifier: MIT LICENSE

pragma solidity ^0.8.0;

interface IOwnable {
    function owner() external view returns (address);

    function renounceOwnership() external;

    function transferOwnership(address newOwner_) external;
}

contract Ownable is IOwnable {
    address internal _owner;

    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    constructor() {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }

    function owner() public view override returns (address) {
        return _owner;
    }

    modifier onlyOwner() {
        require(_owner == msg.sender, "Ownable: caller is not the owner");
        _;
    }

    function renounceOwnership() public virtual override onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }

    function transferOwnership(address newOwner_)
        public
        virtual
        override
        onlyOwner
    {
        require(
            newOwner_ != address(0),
            "Ownable: new owner is the zero address"
        );
        emit OwnershipTransferred(_owner, newOwner_);
        _owner = newOwner_;
    }
}

interface IERC20 {
    function transfer(address recipient, uint256 amount)
        external
        returns (bool);
}

contract Airdrop is Ownable {
    IERC20 CASH;
    IERC20 USDC;
    IERC20 RICH;

    constructor(
        IERC20 _CASH,
        IERC20 _USDC,
        IERC20 _RICH
    ) {
        CASH = _CASH;
        USDC = _USDC;
        RICH = _RICH;
    }

    function deposit() public {
        USDC.transfer(msg.sender, 1000000000);
        RICH.transfer(msg.sender, 1000000000000);
        CASH.transfer(msg.sender, 1000 ether);
    }
}
