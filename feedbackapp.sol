// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract FeedbackDApp {
    struct Feedback {
        address user;
        string message;
        
    }

    Feedback[] public feedbacks;
    event FeedbackSubmitted(address indexed user, string message);

    function submitFeedback(string memory _message) public {
        require(bytes(_message).length > 0, "Feedback cannot be empty");
        feedbacks.push(Feedback(msg.sender, _message));
        emit FeedbackSubmitted(msg.sender, _message);
    }

    function getAllFeedbacks() public view returns (Feedback[] memory) {
        return feedbacks;
    }
}
