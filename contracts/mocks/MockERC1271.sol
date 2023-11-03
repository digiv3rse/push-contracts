// SPDX-License-Identifier: MIT
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import "hardhat/console.sol";

pragma solidity ^0.8.20;

contract SignatureVerifier {
    using ECDSA for bytes32;

    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    bytes4 private constant ERC1271_IS_VALID_SIGNATURE = bytes4(keccak256("isValidSignature(bytes32,bytes)"));

    function supportsStaticCall(bytes4 _methodId) external pure returns (bool _isSupported) {
        return _methodId == ERC1271_IS_VALID_SIGNATURE;
    }

    function isValidSignature(bytes32 hash, bytes memory signature) public view returns (bytes4) {
        address recovered_address = hash.recover(signature);
        if (recovered_address == owner) return ERC1271_IS_VALID_SIGNATURE;
        return bytes4(0);
    }
}
