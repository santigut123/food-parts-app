
create table Nutrient (
   -- Keys.
   nutrientId     int not null auto_increment primary key,

   -- Other columns.
   nutrientName   varchar(128) character set utf8 not null,
   nutrientType   varchar(128) character set utf8 not null,
   description    varchar(1024) character set utf8  -- NOTE Nullable.
)

