# Basic Grading System Smart Contract

This is a simple smart contract implemented in Solidity that manages a basic grading system. The contract allows adding students, updating their grades, retrieving their grades, and resetting their grades.

## Prerequisites

- Solidity ^0.8.0

## Features

1. **Add a Student**: Adds a new student with an ID, name, and grade.
2. **Update Grade**: Updates the grade of an existing student.
3. **Get Grade**: Retrieves the grade of a specific student.
4. **Reset Grade**: Resets the grade of a student to 0.

## Contract Details


To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., xyz.sol). Copy and paste the following code into that file:
```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SchoolGradingSystem {
    struct Student {
        uint id;
        string name;
        uint grade;
    }

    mapping(uint => Student) private students;
    mapping(uint => bool) private studentExists;

    function addStudent(uint _id, string memory _name, uint _grade) public {
        require(_grade <= 100, "Grade must be between 0 and 100");
        require(!studentExists[_id], "Student already exists");

        students[_id] = Student(_id, _name, _grade);
        studentExists[_id] = true;
    }

    function updateGrade(uint _id, uint _newGrade) public {
        require(_newGrade <= 100, "Grade must be between 0 and 100");
        require(studentExists[_id], "Student does not exist");

        students[_id].grade = _newGrade;
    }

    function getGrade(uint _id) public view returns (uint) {
        require(studentExists[_id], "Student does not exist");

        return students[_id].grade;
    }

    function resetGrade(uint _id) public {
        require(studentExists[_id], "Student does not exist");

        students[_id].grade = 0;
        assert(students[_id].grade == 0);
    }
}

```

### Functions

### `addStudent`

Adds a new student with the specified ID, name, and grade.

**Parameters:**
- `_id` (uint): Student ID.
- `_name` (string): Student name.
- `_grade` (uint): Initial grade of the student (must be between 0 and 100).

**Usage:**
```solidity
function addStudent(uint _id, string memory _name, uint _grade) public
```

## `updateGrade`

Updates the grade for the student with the specified ID.

**Parameters:**
- `_id` (uint): Student ID.
- `_newGrade` (uint): New grade to update (must be between 0 and 100).

**Usage:**
```solidity
function updateGrade(uint _id, uint _newGrade) public
```

## `getGrade`

Retrieves the grade of the student with the specified ID.

**Parameters:**
- `_id` (uint): Student ID.

**Returns:**
- (uint): Grade of the student.

**Usage:**
```solidity
function getGrade(uint _id) public view returns (uint)
```

## `resetGrade`

Resets the grade of the student with the specified ID to 0.

**Parameters:**
- `_id` (uint): Student ID.

**Usage:**
```solidity
function resetGrade(uint _id) public
```

**Notes:**

The `resetGrade` function uses `assert` to ensure the grade is reset to zero.

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
