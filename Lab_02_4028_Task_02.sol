// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// NOTE: Deploy this contract (UpdaterContract) first
contract UpdaterContract {
    // NOTE: storage layout must be the same as StudentMarks contract
    uint public marks;
    address public studentAddress;

    function updateStudentMarks(uint _marks) public {
        marks = _marks;
        studentAddress = msg.sender;
    }
}

contract StudentMarks {
    uint public marks;
    address public studentAddress;

    // DelegateCall, this function will use the function from the UpdaterContract but the storage context will still be this contract
    function updateMarksViaDelegateCall(address _updaterContract, uint _marks) public {
    // StudentMarks' storage is set, UpdaterContract is not modified.
        (bool success, ) = _updaterContract.delegatecall(
            abi.encodeWithSignature("updateStudentMarks(uint256)", _marks)
        );
        require(success, "Delegatecall failed.");
    }

}
