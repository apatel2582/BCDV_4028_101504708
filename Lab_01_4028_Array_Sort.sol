// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

library ArrayManipulationLib {
    
    // Sorts the array
    function sort(uint[] storage self) internal {
        uint256 length = self.length;
        
        for (uint256 i = 0; i < length; i++) {
            for (uint256 j = i + 1; j < length; j++) {
                if (self[i] > self[j]) {
                    uint temp = self[i];
                    self[i] = self[j];
                    self[j] = temp;
                }
            }
        }
    }
    
    // Removes duplicates from the array
    function removeDuplicates(uint[] storage self) internal {
        uint256 length = self.length;
        
        if (length == 0) return;
        
        sort(self); // First sort the array
        
        uint256 uniqueCount = 1;
        
        for (uint256 i = 1; i < length; i++) {
            if (self[i] != self[i - 1]) {
                self[uniqueCount] = self[i];
                uniqueCount++;
            }
        }
        
        // Reduce the size of the array
        while (self.length > uniqueCount) {
            self.pop();
        }
    }
}

contract ArrayContract {
    using ArrayManipulationLib for uint[];

    uint[] public numbers;

    function addNumber(uint _number) public {
        numbers.push(_number);
    }

    function getNumbers() public view returns(uint[] memory) {
        return numbers;
    }

    function sortNumbers() public {
        numbers.sort();
    }

    function removeDuplicates() public {
        numbers.removeDuplicates();
    }
}
