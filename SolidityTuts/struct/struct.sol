pragma solidity ^0.8.17;

contract Todos {
    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todo; // createa array struct type

    function create(string calldata _text) public {
        // 3 ways to initialize a struct
        // call like function
        todo.push(Todo(_text, false));

        // // call like mapping
        // todo.push(Todo({text: _text, completed: false}));

        // //create instance of struct

        // Todo memory _todo;
        // _todo.text = _text;
        // todo.push(_todo);
    }

    function updateText(string calldata _text, uint _index) public {
        require(_index < todo.length, "not valid");

        Todo memory _todo = todo[_index];
        _todo.text = _text;
        _todo.completed = !_todo.completed;
        todo[_index] = _todo;
    }

    function getTodo(
        uint _index
    ) public view returns (string memory text, bool completed) {
        require(_index < todo.length, "no valid index");
        Todo storage _todo = todo[_index];
        return (_todo.text, _todo.completed);
    }
}
