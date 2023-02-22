pragma solidity ^0.8.17;

import "./Node.sol";

// SPDX-License-Identifier: Apache2

interface TrieDB {
    function get(bytes32 hash) external returns (bytes memory);
    // function length() external returns (uint256);    // Not implemented in substrateTrieDB

    function decodeNodeKind(bytes memory encoded) external pure returns (NodeKind memory);
    function decodeNibbledBranch(NodeKind memory node) external pure returns (NibbledBranch memory);
    function decodeExtension(NodeKind memory node) external pure returns (Extension memory);
    function decodeBranch(NodeKind memory node) external pure returns (Branch memory);
    function decodeLeaf(NodeKind memory node) external pure returns (Leaf memory);
    function load(NodeHandle memory node) external returns (bytes memory);

    // default implementation not allowed
    // function load(NodeHandle memory node) external returns (bytes memory) {
    //     if (node.isInline) {
    //         return node.inLine;
    //     } else if (node.isHash) {
    //         return this.get(node.hash);
    //     }

    //     return bytes("");
    // }
}