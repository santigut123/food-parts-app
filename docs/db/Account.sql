
create table Account (
   -- Keys.
   accountId   int not null auto_increment primary key,

   -- Other columns.
   accountName varchar(128) character set utf8 not null,
   calorieGoal int not null
)

