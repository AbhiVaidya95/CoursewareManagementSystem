create database wsos
use wsos
/* USERSTABLE :- ALL THE USERS ACCOUNT INFORMAION WILL BE STORED HERE */
create table userstable(
uname varchar(max),
uemail varchar(max),
upass varchar(max),
useq varchar(max),
uans varchar(max),
ucontact varchar(max),
ubranch varchar(max),
roles varchar(max))

insert into userstable values ('Administrator','admin@wsos.com','pass','What is your Birth Place?','Dhule','9890098900','','Admin')
/*delete from userstable where uemail='admin@wsos.com' */
select * from userstable


/* STAFFSUB :- SUBJECTS ALLOCATE TO THE STAFF ARE MENTIONED HERE IN THIS TABLE*/
create table staffsub(
uemail varchar(max),
ubranch varchar(max),
sub1 varchar(max),
sub2 varchar(max))

select * from staffsub
truncate table staffsub

/* subject_table  :- BRANCH AND THEIR RESPECTIVE SUBJECTS ARE STORED HERE*/
create table subject_table(
bname varchar(max),
sname varchar(max))

insert into subject_table values('IT','CAM')

select * from subject_table
truncate table subject_table

/* contents :- THIS TABLE WILL CONTAIN THE UPLOAD CONTENT INFORMATION, UPLOADED BY THE STAFF */
create table contents(
cid int primary key,
des varchar(max),
cname varchar(max),
branch varchar(max),
subject varchar(max),
semail varchar(max),
sname varchar(max),
dates varchar(max),
times varchar(max))

select * from contents
truncate table contents


/* CREATE TABLE FOR ADMIN MESSAGES FROM STAFF TO DELETE THE CONTENT UPLOADED BY HIM*/

//---------------------------- INBOX
create table inbox(
id int primary key,
msg varchar(max),
semail varchar(max),
sname varchar(max),
sendto varchar(max),
branch varchar(max),
dates varchar(max),
times varchar(max))

select * from inbox
truncate table inbox

//--------------------------- OUTBOX

create table outbox(
id int primary key,
msg varchar(max),
semail varchar(max),
sname varchar(max),
sendto varchar(max),
branch varchar(max),
dates varchar(max),
times varchar(max))

select * from outbox
truncate table outbox

-----------------------------

create table adminmsg(
fid int primary key,
fname varchar(max),
semail varchar(max),
sname varchar(max),
branch varchar(max),
dates varchar(max),
times varchar(max))

select * from adminmsg

drop table adminmsg


/* TABLE OF COMENTS ON THE CONTENT UPLOADED BY THE STAFF AND WILL ONLY DISPLAY RESPECTIVE STAFF*/

create table comments(
staffemail varchar(max),
fid int primary key,
fname varchar(max),
comt varchar(max),
dates varchar(max),
times varchar(max),
sname varchar(max),
semails varchar(max))

select * from comments

truncate table comments

// NOTIFICATIONS

create table noti(
id int primary key,
uid varchar(max),
roles varchar(max),
msg varchar(max),
dates varchar(max),
times varchar(max))

select * from noti