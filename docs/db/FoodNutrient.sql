
create table FoodNutrient (
   -- Keys.
   foodId         int not null references Food(foodId),
   nutrientId     int not null references Nutrient(nutrientId),

   -- Other columns.
   unit           varchar(128) character set utf8 not null,
   amountUnit     int not null,
   amountPercent  int not null,

   -- Constraints.
   primary key(foodId, nutrientId)
)

