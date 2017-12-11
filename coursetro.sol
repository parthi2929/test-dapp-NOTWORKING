pragma solidity ^0.4.0;

contract Coursetro
{
    string instructorName;
    uint instructorAge;
    address owner;

    function Coursetro() public
    {
        owner = msg.sender;
    }

    event InstructorEvent(string name, uint age);

    modifier isOwner 
    {
        require(msg.sender == owner);
        _;
    }
    
    function setInstructor(string _instructorName, uint _instructorAge) public isOwner
    {
        instructorName = _instructorName;
        instructorAge = _instructorAge;
        InstructorEvent(instructorName, instructorAge);
    }
    
    function getInstructor() public constant returns (string, uint)
    {
        return (instructorName, instructorAge);
    }
    
}