// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BasicGradingSystem {
    struct Student {
        uint id;
        string name;
        uint grade;
    }

    mapping(uint => Student) private students;

    // Function to add a new student
    function addStudent(uint _id, string memory _name, uint _grade) public {
        // Ensure the grade is between 0 and 100
        require(_grade <= 100, "Grade must be between 0 and 100");

        students[_id] = Student(_id, _name, _grade);
    }

    // Function to update a student's grade
    function updateGrade(uint _id, uint _newGrade) public {
        // Ensure the grade is between 0 and 100
        require(_newGrade <= 100, "Grade must be between 0 and 100");

        students[_id].grade = _newGrade;
    }

    // Function to get a student's grade
    function getGrade(uint _id) public view returns (uint) {
        // Revert if the student does not exist
        if (bytes(students[_id].name).length == 0) {
            revert("Student does not exist");
        }

        return students[_id].grade;
    }

    // Function to reset a student's grade
    function resetGrade(uint _id) public {
        students[_id].grade = 0;

        // Ensure the grade is reset to zero
        assert(students[_id].grade == 0);
    }
}
