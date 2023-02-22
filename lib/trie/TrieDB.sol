pragma solidity ^0.8.17;

import "./Node.sol";

// SPDX-License-Identifier: Apache2

interface ITrieDB {
    function get(bytes32 hash) external returns (bytes memory);
    function decodeNodeKind(bytes memory encoded) external pure returns (NodeKind memory);
    function decodeNibbledBranch(NodeKind memory node) external pure returns (NibbledBranch memory);
    function decodeExtension(NodeKind memory node) external pure returns (Extension memory);
    function decodeBranch(NodeKind memory node) external pure returns (Branch memory);
    function decodeLeaf(NodeKind memory node) external pure returns (Leaf memory);
}
abstract contract TrieDB is ITrieDB {
    function load(NodeHandle memory node) external returns (bytes memory) {
        if (node.isInline) {
            return node.inLine;
        } else if (node.isHash) {
            return this.get(node.hash);
        }

        return bytes("");
    }
}