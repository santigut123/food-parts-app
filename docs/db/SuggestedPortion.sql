
create table SuggestedPortion (
   -- Keys
   foodId               int not null references Food(foodId),
   suggestedPortionName varchar(128) character set utf8 not null,

   -- Other columns.
   conversion           float not null,

   -- Constraints.
   primary key(foodId, suggestedPortionName)
)

