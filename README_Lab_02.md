# BCDV 4028 - Lab 2 Task 2: Delegatecall Demonstration

This repository provides a hands-on example of the `delegatecall` functionality in Solidity. The demonstration involves two contracts: `StudentMarks` and `UpdaterContract`. The former contract invokes the logic of the latter using `delegatecall`, but updates its own storage rather than the storage of `UpdaterContract`.

## UpdaterContract:
Contains a method named `updateStudentMarks` designed to update its internal variables: `marks` and `studentAddress`, based on the details of the caller.

## StudentMarks:
Leverages `delegatecall` to execute the `updateStudentMarks` function of the `UpdaterContract`. Instead of modifying the `UpdaterContract`'s storage, it updates its own variables.

### Steps to Demonstrate:

1. **Deploy `UpdaterContract`**: Begin by deploying the `UpdaterContract`. This will act as the target for our `delegatecall`. ![Screenshot_4](https://github.com/apatel2582/BCDV_4028_101504708/assets/126298288/97cdd59c-8c8c-46be-b4b8-42b567737835)

2. **Deploy `StudentMarks`**: Next, deploy the `StudentMarks` contract. This will use `delegatecall` to invoke the function from `UpdaterContract`. ![Screenshot_5](https://github.com/apatel2582/BCDV_4028_101504708/assets/126298288/6af97a05-f90d-40de-8fe6-249f9ae4e689)

3. **Invoke `updateMarksViaDelegateCall`**: Call this function on `StudentMarks`, passing in the address of the deployed `UpdaterContract` and the marks value you want to set.

4. **Verify Changes**: Check the storage variables of `StudentMarks`. You should see that the `marks` and `studentAddress` values have been updated. However, the corresponding values in `UpdaterContract` will remain unchanged. ![Screenshot_6](https://github.com/apatel2582/BCDV_4028_101504708/assets/126298288/d624f7a0-8919-45ff-b8a8-de234157be5c) ![Screenshot_7](https://github.com/apatel2582/BCDV_4028_101504708/assets/126298288/77453073-9fa3-4025-a03f-a9ba82477239) ![Screenshot_8](https://github.com/apatel2582/BCDV_4028_101504708/assets/126298288/2cde5a24-f115-4084-85a4-11bc62586279)

### Important Points:
- **Storage Layout**: It's essential for both contracts to have consistent storage layouts. This implies that the sequence and types of state variables should match in both contracts.
  
- **Storage Context**: In a `delegatecall`, the code from the targeted contract is executed, but the storage updates occur in the calling contract.
  
- **Message Sender Consistency**: The `msg.sender` value remains unchanged during the `delegatecall`, representing the initial entity that initiated the function call on `StudentMarks`.

## Conclusion:
Grasping the nuances of `delegatecall` is pivotal for contract upgradability and interactions between contracts in the Ethereum framework. This lab serves as a practical insight into these intricacies.


Anishkumar Pankajkumar Patel
101504708
T-475 Blockchain Development
