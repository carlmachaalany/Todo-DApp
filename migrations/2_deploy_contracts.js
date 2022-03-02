//Any time we create a new smart contract, we are updating the state of the blockchain. 
//Remember, I said that a blockchain fundamentally is a database. Hence, whenever we permanently change it, we must migrate it from one state to another. 
//This is very similar to a database migration that you might have performed in other web application development frameworks


const TodoList = artifacts.require('./TodoList.sol');

module.exports = function(deployer) {
    deployer.deploy(TodoList);
};

