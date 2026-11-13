// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Guestbook {
    struct Message {
        address author;
        string text;
        uint256 timestamp;
    }

    Message[] public messages;

    function postMessage(string calldata text) external {
        require(bytes(text).length > 0, "Message cannot be empty");
        messages.push(Message(msg.sender, text, block.timestamp));
    }

    function messageCount() external view returns (uint256) {
        return messages.length;
    }

    function getMessage(uint256 index)
        external
        view
        returns (address author, string memory text, uint256 timestamp)
    {
        Message storage item = messages[index];
        return (item.author, item.text, item.timestamp);
    }
}
