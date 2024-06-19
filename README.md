# ErrorHandling Smart Contract

## Overview

This is a simple Solidity smart contract designed to demonstrate basic error handling mechanisms in the Ethereum blockchain. The contract includes functions that utilize `require`, `assert`, and `revert` statements to enforce certain conditions and handle errors gracefully.

## Features

- **setValue**: Sets the contract's state variable `value` with a requirement that the value must be greater than zero.
- **resetValue**: Resets the state variable `value` to zero and asserts that the reset was successful.
- **revertIfTooHigh**: Reverts the transaction if the provided value is greater than 100.

## Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., xyz.sol). Copy and paste the following [Code file]() into that file.

## Functions

### setValue(uint _value)

This function sets the `value` state variable. It uses a `require` statement to ensure that the provided value is greater than zero.

#### Parameters:
- `_value` (uint): The value to be set. Must be greater than zero.

#### Usage:
```solidity
function setValue(uint _value) public {
    require(_value > 0, "Value must be greater than zero");
    value = _value;
}
```
### resetValue()

This function resets the `value` state variable to zero. It uses an `assert` statement to ensure that the reset operation was successful.

#### Usage:
```solidity
function resetValue() public {
    value = 0;
    assert(value == 0);
}
```
### revertIfTooHigh(uint _value)

This function reverts the transaction if the provided value is greater than 100. It uses a `revert` statement for this purpose.

#### Parameters:
- `_value` (uint): The value to be checked. Must be 100 or less.

#### Usage:
```solidity
function revertIfTooHigh(uint _value) public pure {
    if (_value > 100) {
        revert("Value must be 100 or less");
    }
}
```
## Error Handling Mechanisms

### require

The `require` statement is used to validate inputs and conditions before executing the function's logic. If the condition is not met, the transaction is reverted and an optional error message is provided.

### assert

The `assert` statement is used for internal error checking. It should be used to check for conditions that should never occur. If the condition fails, it indicates a bug in the contract and the transaction is reverted.

### revert

The `revert` statement is used to revert the transaction if certain conditions are not met. It is useful for complex conditional checks and can also provide an error message.

## Authors

- Garv Kumar (garvkumar287@gmail.com)

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
