pragma solidity ^0.8.7;

//struct are the way of creating user-defined data types. which store multiple of data types like Stude
// Student is Struct type can have name, roll number,qualifciation etc

// keyword struct Name{type of Var anyVAr}
contract Structure {
    struct Book {
        string Title;
        string Author;
        uint bookId;
        uint Price;
    }

    Book book; // here intialise the book by Book type which is struct type

    function setBook() public {
        book = Book("Blockchain for beginner", "Deepak", 25, 500);
    }

    function getBookId() public view returns (uint) {
        return book.bookId;
    }

    function setTitle(string calldata _title) public {
        book.Title = _title;
    }

    function getTitle() public view returns (string memory) {
        return book.Title;
    }
}
