var Migrations = artifacts.require("./Migrations.sol");
const OSTComposer = artifacts.require("./OSTComposer.sol");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(OSTComposer);
};
