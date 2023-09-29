create table info_student(
    id_student number primary key not null,
    fullname varchar2 (100) not null,
    phone_number number (11) not null,
    DATE_OF_BIRTH DATE NOT NULL,
    class_name varchar2 (3) not null,
)
create table book_list(
    book_id number primary key not null,
    book_name varchar2 (100) not null,
    the_writer varchar2 (100) not null,
)
create table Loaned_books(
id_student number primary key not null,
fullname varchar2 (100) not null foreign key ( fullname ) references info_student ( fullname );,
book_id number primary key not null,
book_name varchar2 (100) not null foreign key ( book_name ) references book_list ( book_name );
Date_of_lending DATE not null
)
CREATE VIEW student_library AS
SELECT id_student, fullname, phone_number, book_id, book_name, Date_of_lending,
FROM info_student, book_list,Loaned_books;

CREATE OR REPLACE TRIGGER trg_update_return_date
BEFORE UPDATE ON Loaned_books
FOR EACH ROW
BEGIN
:NEW.return_date := :NEW.Date_of_lending + 7;
END;