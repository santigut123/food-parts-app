
/*
 * Default amount is always 100 g, so no column needed for that.
 */
create table Food (
   -- Keys.
   foodId      int not null auto_increment primary key,

   -- Other columns.
   foodName    varchar(128) character set utf8 not null,
   description varchar(1024) character set utf8,  -- NOTE Nullable.
   accountId   int references Account(accountId),  -- NOTE Nullable.
   calories    int not null,
   isRecipe    boolean not null
)

