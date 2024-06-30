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
