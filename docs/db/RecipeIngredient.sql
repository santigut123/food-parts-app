
create table RecipeIngredient (
   -- Keys.
   recipeId    int not null references Food(foodId),
   foodId      int not null references Food(foodId),
   accountId   int not null references Account(accountId),

   -- Other columns.
   grams       int not null,

   -- Constraints.
   primary key(recipeId, foodId, accountId)
)

