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

contract randomSource is Ownable {
    address Game;
    uint256 count;

    modifier onlyGame() {
        require(Game == msg.sender, "Ownable: caller is not the game");
        _;
    }

    function setGame(address game) external onlyOwner {
        Game = game;
    }

    function update(uint256 _seed) external onlyGame {
        require(msg.sender == Game, "Only Game");
        if (_seed != 0) {
            count = _seed;
        }
    }

    function seed() external view returns (uint256) {
        return
            uint256(
                keccak256(
                    abi.encodePacked(
                        blockhash(block.number - 1),
                        block.timestamp,
                        count
                    )
                )
            );
    }
}
