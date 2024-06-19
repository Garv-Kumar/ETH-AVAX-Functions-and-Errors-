// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorHandling {
    uint public value;

    // Function to set the value with require check
    function setValue(uint _value) public {
        // Ensure the value is greater than zero
        require(_value > 0, "Value must be greater than zero");
        value = _value;
    }

    // Function to reset the value with assert check
    function resetValue() public {
        // Set value to zero
        value = 0;

        // Ensure the value is reset to zero
        assert(value == 0);
    }

    // Function to revert if a condition is not met
    function revertIfTooHigh(uint _value) public pure {
        // Revert if the value is greater than 100
        if (_value > 100) {
            revert("Value must be 100 or less");
        }
    }
}
