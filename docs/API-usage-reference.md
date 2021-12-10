
# API Reference

These are examples of calls on the RESTful server.



--------------------------------------------------------------------------------

## RESULTS OF REFERENCE RDA API CALL
This returns the reference for a 2000 calorie diet (the thing on the back of a label).

#### **GET** request on `URL/rda-reference`:
Response body:
```json
[
   { name: "vitamin a", nutrientType: "vitamin", amount: 10, unit: "mg" },
   { name: "polyunsaturated", nutrientType: "fat", amount: 20, unit: "g" },
]
```



--------------------------------------------------------------------------------

## RESULTS OF NUTRIENT API CALL
Returns the nutrients of a searched up food.

#### **GET** request on `URL/user/:userid/foods?foodid=:foodid`:
Response body is the same as using `name=:name` except that this only returns ONE object (using `name=:name` does a fuzzy search and returns an array of objects).

#### **GET** request on `URL/user/:userid/foods?name=bee`:
Does a fuzzy search.

Response body:
```json
[
   {
      foodName: "beef stew",
      foodId: 23423234,
      description: "Lorem ipsum",
      recipe: true,
      calories: 420,
      nutrients = [
         {
            name: "vitamin a",
            nutrientType: "vitamin",
            amount: 20,
            unit: "mg",
            rda: 30.5,
         },
         {
            name: "polyunsaturated",
            nutrientType: "fat",
            amount: 20,
            unit: "mg",
            rda: 30.5,
         },
      ],
      suggestedPortions: [
         {
            conversion: 2,
            name: "one serving",
         },
         {
            conversion: .5,
            name: "two oz",
         },
      ],
   },
   {
      name: "beet",
      ...
   }
]
```



--------------------------------------------------------------------------------

## RESULTS OF RECIPE API CALL

This returns a specific recipe that the user searches for.

TODO
- Eventually be able to add recipes.

#### **GET** request on `URL/user/:userid/recipes/beef stew`:
Response body:
```json
{
   name: "beef stew",
   description: "Lorem ipsum",
   recipe: true,
   foods: [
      {
         foodName: "beef",
         grams: 30,  -- In grams.
      },
      {
         foodName: "apple",
         grams: 10,  -- In grams.
      }
   ],
   /* Also include all the stuff from nutrient call OR make separate call. */
}
```



--------------------------------------------------------------------------------

## RESULTS OF USER FOOD TRACKER API CALLS

These are for the food-tracking functionality, where a user can keep track of their daily intake, calories, etc.


#### **PUT** request on `URL/user/:userid/tracker`:
Request body:
```json
{
   foodName: "beef stew",
   foodId: 23423234,
   description: "Lorem ipsum",
   gramsEaten: 10,
   datetime: "2021-12-09 13:00:00"
}
```

Response body:
```json
{
   eatenId: 2342938423
}
```

#### **GET** request on `URL/user/:userid/tracker/date/start=2021-10-20&end=2021-10-21`:
Response body:
```json
[
   {
      foodName: "beef stew",
      foodId: 23423234,
      description: "Lorem ipsum",
      gramsEaten: 10,
      datetime: "2021-12-09 13:00:00"
   },
   ...
]
```

#### **DELETE** request on `URL/user/:userid/tracker/:eatenid`:
No response body. Just standard HTTP status for error/no error.



--------------------------------------------------------------------------------

## RESULTS OF USER API CALLS

These are for CRUD operations on user accounts.

TODO
- Be able to update and delete user accounts.

#### **POST** request on `URL/user`:
Response body:
```json
{
   id: 234234234,
}
```

#### **GET** request on `URL/user/:userid`:
Response body:
```json
{
   name: "Bob",
   age: 37,
   sex: "m",
   weight: 201,
   rdaPreferences: [
      { name: "vitamin a", nutrientType: "vitamin", rda: 200, amount: 20, unit: "mg" },
      { name: "polyunsaturated", nutrientType: "fat", rda: 150, amount: 30, unit: "g" },
   ],
   macroPreferences: [
      { nutrientType: "fat", rda: 200, amount: 30, unit: "g", caloriePercentage: .33 },
   ],
}
```















