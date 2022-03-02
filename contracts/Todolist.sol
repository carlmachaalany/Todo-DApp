pragma solidity >=0.4.16 <0.9.0;

//SMART CONTACT CANNOT CHANGE. IT DOESNT UPDATE

contract TodoList {
    //unit is integer that ranges from 0 to inifinty. unsigned integer means no negative numbers
    //we can create a way to access the value of this state variable outside of the contract. We can do this with a special modifier keyword called public in Solidity. When we do this, Solidity will magically create a taskCount() function so that we can access this variable's value outside of the smart contract. This will be useful when we are interacting with the smart contract in the console, from the client side application, and inside the test files.
    uint public taskCount = 0;

    struct Task {
        // unsigned int
        uint id;
        // string for todo list content
        string content; // _content
        // true ou false for completed todo list.
        bool completed;
    }

    // Mapping in solidity is like an array in other languages. its creates key-value in the blockchain
    // teh key-value is our id 
    mapping(uint => Task) public tasks;


    /* This function will get run only once, whenever the contract is initialized, i.e., deployed to the blockchain. 
    Inside of this function, we have created one new default task with the string content.
     */
    constructor() public {
        createTask("Learning Blockchain :)");
    }

   /* First, we create the function with the function keyword, and give it a name createTask()
    We allow the function to accept one argument called _content, which will be the text for the task. We specify that this argument will be of string data type, and that it will persist in memory
    We set the function visibility to public so that it can be called outside of the smart contract, like in the console, or from the client side for example
    Inside the function, we create an id for the new task. We simply take the existing taskCount and increment it by 1.
    Now we create a new task struct by calling Task(taskCount, _content, false); and passing in the values for the new task.
    Next, we store the new task on the blockchain by adding it to the tasks mapping like this: task[taskCount] = .... */

    // public because we can call it outside of the smart contact
    function createTask(string memory _content) public {
        taskCount ++;
        tasks[taskCount] = Task(taskCount, _content, false);
    }

}


//truffle console is to check that if a smart contact is inside the blockchain