const OSTComposer = artifacts.require("./OSTComposer.sol");
const Web3 = require('web3');

async function submit() {


  const address = '0x85cE068D8E0fa79E32a9c070A5B6Ac4220C78001';
  const web3 = new Web3('http://localhost:8545');
  const ostComposer = await OSTComposer.at(address);
  const accounts = await web3.eth.getAccounts();
  const stakeRequest = {
    amount: "10",
    beneficiary: accounts[0],
    gasPrice: "1",
    gasLimit: "2",
    nonce: "1",
    gateway: accounts[1]
  };

  for (let i = 0; i < 5; i++) {
    const receipt = await ostComposer.requestStake(
      stakeRequest.amount,
      stakeRequest.beneficiary,
      stakeRequest.gasPrice,
      stakeRequest.gasLimit,
      stakeRequest.nonce,
      stakeRequest.gateway,
    );
    console.log('\n');
    console.log('\n');
    console.log("******************************");
    console.log("receipt  ", JSON.stringify(receipt));
    console.log('\n');
    console.log('\n');
  }
}

module.exports = function (callback) {
  submit().then(() =>
    console.log("done")).catch((e) =>
    console.log(e));
}