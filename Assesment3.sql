create database assesment3
use assesment3
--creating subject table
CREATE TABLE [Subject] (
    subjectId INT PRIMARY KEY,
    subtitle VARCHAR(20) NOT NULL
);
select * from Subject
--crating book table

CREATE TABLE Book (
    bookId INT PRIMARY KEY,
    title VARCHAR(20) NOT NULL,
    price INT NOT NULL,
    volume INT,
    author VARCHAR(20) NOT NULL,
    publishDate DATE,
    subjectId INT,
    FOREIGN KEY (subjectId) REFERENCES Subject(subjectId)
);


--1.Insert 5 diff subjects in subject table

INSERT INTO Subject  VALUES (1, 'Mathematics');
INSERT INTO Subject  VALUES (2, 'Physics');
INSERT INTO Subject  VALUES (3, 'Chemistry');
INSERT INTO Subject  VALUES (4, 'Biology');
INSERT INTO Subject  VALUES (5, 'Computer Science');

--2.Insert 15 diff books of 5 subjects in books table

INSERT INTO Book  VALUES (1, 'GoldName', 40, 1, 'Ramana', '2023-03-01', 1);
INSERT INTO Book  VALUES (2, 'Friendship', 45, 2, 'Krishna', '2023-03-15', 1);
INSERT INTO Book  VALUES (3, 'Dance', 55, 1, 'David', '2023-04-01', 1);


INSERT INTO Book VALUES (4, 'Peace', 60, 1, 'Thulasi', '2023-05-01', 2);
INSERT INTO Book VALUES (5, 'Electromagnetism', 65, 1, 'Sai', '2023-05-10', 2);
INSERT INTO Book VALUES (6, 'Quantum Physics', 70, 2, 'Gayathri', '2023-06-01', 2);


INSERT INTO Book  VALUES (7, 'Organic Chemistry', 50, 1, 'Ganesh', '2023-06-15', 3);
INSERT INTO Book  VALUES (8, 'Inorganic Chemistry', 55, 1, 'Reshma', '2023-07-01', 3);
INSERT INTO Book  VALUES (9, 'Physical Chemistry', 60, 2, 'Janu', '2023-07-15', 3);


INSERT INTO Book  VALUES (10, 'Cell Biology', 45, 1, 'Dilly', '2023-08-01', 4);
INSERT INTO Book  VALUES (11, 'Genetics', 50, 1, 'Lavanya', '2023-08-15', 4);
INSERT INTO Book VALUES (12, 'Evolutionary Biology', 55, 2, 'Rohit', '2023-09-01', 4);


INSERT INTO Book  VALUES (13, 'Introduction to Programming', 40, 1, 'Rakesh', '2023-09-15', 5);
INSERT INTO Book  VALUES (14, 'Data Structures and Algorithms', 50, 1, 'Sushma', '2023-10-01', 5);
INSERT INTO Book VALUES (15, 'Database Management Systems', 60, 2, 'Ram', '2023-10-15', 5);


select * from Book


-- 3.Write a query to retrieve the book and its subject details using inner join.
select b.bookId,b.title,b.volume,b.subjectId,b.price,b.author,b.publishDate,s.subtitle
from [Subject] as s
inner join Book as b
on s.subjectId=b.subjectId

--4.Write a query to retrieve the books list published in a given specific date interval
select bookId, title, price, volume, author, publishDate, subjectId
from Book
where publishDate BETWEEN '2023-01-01' AND '2023-06-30';

--5.Write a query to retrieve the number of books referred by each author
select author, COUNT(*) AS numberOfBooks
from Book
group by author;

--6. Write a query to retrieve the number of books referred by each subject
select s.subtitle AS subject, COUNT(b.bookId) AS numberOfBooks
from Book b
JOIN Subject s ON b.subjectId = s.subjectId
group  by s.subtitle;

--7. Write a query to retrieve the number of books published by the year 2000
select COUNT(*) AS numberOfBooks
from Book
where Year(publishDate) = 2000;

-- 8.Write a query to update price and volume of a book using bookId.
update Book
set price = 55, volume = 3
where bookId = 1;

-- 9.Write a query to update price of English subject books 10%
update Book
set price = price * 1.10
where subjectId = (
    select subjectId
    from Subject
    where subtitle = 'Physics'
);

--10.Write a query to delete a book using bookId
delete from Book
where bookId = 12;

--11.Write a query to retrieve books who’s price is >500 and subject is maths.
select b.bookId, b.title, b.price, b.volume, b.author, b.publishDate, s.subtitle as subject
from Book b
JOIN Subject s ON b.subjectId = s.subjectId
where b.price > 500
  AND s.subtitle = 'Mathematics';

--12.Write a query to retrieve the book and its subject details with ascending order of subject.
select b.bookId, b.title, b.price, b.volume, b.author, b.publishDate, s.subtitle as subject
from Book b
JOIN Subject s ON b.subjectId = s.subjectId
Order by s.subtitle ASC;

--13.Write a query to retrieve the min price of book details.
select bookId, title, price, volume, author, publishDate, subjectId
from Book
where price = (select MIN(price) from Book);

--14.Write a query to retrieve the min price of the book details 
select bookId, title, price, volume, author, publishDate, subjectId
from Book
where price = (select MIN(price) from Book);

--15.Write a query to count the no of books of subject maths.

select COUNT(*) AS numberOfBooks
from Book b
JOIN Subject s on b.subjectId = s.subjectId
where s.subtitle = 'Mathematics';

--16.Write a query to display books of subject Physics, Mathematics and Comuter science.
select b.bookId, b.title, b.price, b.volume, b.author, b.publishDate, s.subtitle as subject
from Book b
JOIN Subject s on b.subjectId = s.subjectId
where s.subtitle IN ('Physics', 'Mathematics', 'Computer Science');










