# the-graph-poc

This project will create dummy events on a contract which can be used to test `test-graph`


##### Prerequisite : Running ganache instance

## Step 1 
Deploy contract and note down the contract address
```
truffle compile
truffle migrate
```

## Step 2 
Copy contract address in the test file `test/ostcomposer.js` line 7.

## Step 3 
Run test test 

```
truffle exec test/ostcomposer.js
```
