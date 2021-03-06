
# API Reference

These are examples of calls on the RESTful server.



--------------------------------------------------------------------------------

## RESULTS OF REFERENCE RDA API CALL
This returns the reference for the recommended daily intake amounts for a 2000 calorie diet (the thing on the back of a label).

#### **GET** request on `URL/rda-reference`:
Response body:
```json
[
   { "vitaminName": "vitamin a", "nutrientType": "vitamin", "amount": 10, "unit": "mg" },
   { "vitaminName": "vitamin b7", "nutrientType": "vitamin", "amount": 5, "unit": "mg" },
   { "vitaminName": "vitamin b9", "nutrientType": "vitamin", "amount": 0, "unit": "mg" },
   { "vitaminName": "vitamin b12", "nutrientType": "vitamin", "amount": 30, "unit": "mg" },
   { "vitaminName": "vitamin d", "nutrientType": "vitamin", "amount": 10, "unit": "mg" },
   { "vitaminName": "polyunsaturated", "nutrientType": "fat", "amount": 20, "unit": "g" },
   { "vitaminName": "saturated", "nutrientType": "fat", "amount": 3, "unit": "g" },
]
```



--------------------------------------------------------------------------------

## RESULTS OF FOOD/NUTRIENT API CALL
Returns the nutrient profile of a searched up food.

#### **GET** request on `URL/user/:userId/foods?foodName=bee`:
Does a fuzzy search.

Response body:
```json
[
   {
      "foodName": "beef stew",
      "foodId": 23423234,
      "description": "Lorem ipsum",
      "recipe": true,
      "calories": 420,
      "nutrients": [
         {
            "nutrientName": "vitamin a",
            "nutrientType": "vitamin",
            "amount": 20,
            "unit": "mg",
            "amt": 30.5,
         },
         {
            "nutrientName": "polyunsaturated",
            "nutrientType": "fat",
            "amount": 20,
            "unit": "mg",
            "rda": 30.5,
         }
      ],
      "suggestedPortions": [
         {
            "conversion": 2,
            "suggestedPortionName": "one serving",
         },
         {
            "conversion": 0.5,
            "suggestedPortionName": "two oz",
         }
      ]
   },
   {
      "foodName": "beet",
      "foodId": 123412341234,
      "description": "Dolorem ipsium",
      "recipe": false,
      "calories": 420,
      "nutrients": [
         {
            "nutrientName": "vitamin a",
            "nutrientType": "vitamin",
            "amount": 20,
            "unit": "mg",
            "amt": 30.5,
         },
         {
            "nutrientName": "polyunsaturated",
            "nutrientType": "fat",
            "amount": 20,
            "unit": "mg",
            "rda": 30.5,
         }
      ],
      "suggestedPortions": [
         {
            "conversion": 2,
            "suggestedPortionName": "one serving",
         },
         {
            "conversion": 0.5,
            "suggestedPortionName": "two oz",
         }
      ]
   }
]
```

#### **GET** request on `URL/user/:userId/foods?foodId=:foodId`:
Response body is the same as using `foodName=:foodName` except that this only returns ONE object (using `name=:name` does a fuzzy search and returns an array of objects).

Response body:
```json
{
   "foodName": "beet",
   "foodId": 123412341234,
   "description": "Dolorem ipsium",
   "recipe": false,
   "calories": 420,
   "nutrients": [
      {
         "nutrientName": "vitamin a",
         "nutrientType": "vitamin",
         "amount": 20,
         "unit": "mg",
         "amt": 30.5,
      },
      {
         "nutrientName": "polyunsaturated",
         "nutrientType": "fat",
         "amount": 20,
         "unit": "mg",
         "rda": 30.5,
      }
   ],
   "suggestedPortions": [
      {
         "conversion": 2,
         "suggestedPortionName": "one serving",
      },
      {
         "conversion": 0.5,
         "suggestedPortionName": "two oz",
      }
   ]
}
```



--------------------------------------------------------------------------------

## RESULTS OF RECIPE API CALL

This returns a specific recipe that the user searches for.

TODO
- Eventually be able to add recipes.

#### **GET** request on `URL/user/:userId/recipes?foodName=beef stew`:
Note that the response is very similar to the response of a FOOD/NUTRIENT API call. In fact, we are guaranteed that all attributes (e.g., "foodName", "nutrients", "suggestedPortions", etc) of a FOOD/NUTRIENT API response will be here.

Response body:
```json
[
   {
      "foodName": "beef stew",
      "description": "Lorem ipsum",
      "recipe": true,
      "foods": [
         {
            "foodName": "beef",
            "foodId": 123412341234,
            "grams": 30
         },
         {
            "foodName": "apple",
            "foodId": 123412341234,
            "grams": 10
         }
      ],
      "nutrients": [
         {
            "nutrientName": "vitamin a",
            "nutrientType": "vitamin",
            "amount": 20,
            "unit": "mg",
            "amt": 30.5,
         },
         {
            "nutrientName": "polyunsaturated",
            "nutrientType": "fat",
            "amount": 20,
            "unit": "mg",
            "rda": 30.5,
         }
      ],
      "suggestedPortions": [
         {
            "conversion": 2,
            "suggestedPortionName": "one serving",
         },
         {
            "conversion": 0.5,
            "suggestedPortionName": "two oz",
         }
      ]
   }
]
```

#### **GET** request on `URL/user/:userId/recipes?foodId=:foodId`:
Response body is the same as using `foodName=:foodName` except that this only returns ONE object (using `foodName=:foodName` does a fuzzy search and returns an array of objects).

Response body:
```json
{
   "foodName": "beef stew",
   "description": "Lorem ipsum",
   "recipe": true,
   "foods": [
      {
         "foodName": "beef",
         "foodId": 123412341234,
         "grams": 30
      },
      {
         "foodName": "apple",
         "foodId": 123412341234,
         "grams": 10
      }
   ],
   "nutrients": [
      {
         "nutrientName": "vitamin a",
         "nutrientType": "vitamin",
         "amount": 20,
         "unit": "mg",
         "amt": 30.5,
      },
      {
         "nutrientName": "polyunsaturated",
         "nutrientType": "fat",
         "amount": 20,
         "unit": "mg",
         "rda": 30.5,
      }
   ],
   "suggestedPortions": [
      {
         "conversion": 2,
         "suggestedPortionName": "one serving",
      },
      {
         "conversion": 0.5,
         "suggestedPortionName": "two oz",
      }
   ]
}
```


--------------------------------------------------------------------------------

## RESULTS OF USER FOOD TRACKER API CALLS

These are for the food-tracking functionality, where a user can keep track of their daily intake, calories, etc.


#### **PUT** request on `URL/user/:userId/tracker`:
Request body:
```json
{
   "foodName": "beef stew",
   "foodId": 23423234,
   "description": "Lorem ipsum",
   "gramsEaten": 10,
   "datetime": "2021-12-09 13:00:00"
}
```

Response body:
```json
{
   "eatenId": 2342938423
}
```

#### **GET** request on `URL/user/:userId/tracker/date/start=2021-10-20&end=2021-10-21`:
Response body:
```json
[
   {
      "foodName": "beef stew",
      "foodId": 23423234,
      "description": "Lorem ipsum",
      "gramsEaten": 100,
      "datetime": "2021-12-09 13:00:00"
   },
   {
      "foodName": "taco",
      "foodId": 51515151515,
      "description": "Mexico ipsum",
      "gramsEaten": 250,
      "datetime": "2021-12-09 17:00:00"
   }
]
```

#### **DELETE** request on `URL/user/:userId/tracker/:eatenId`:
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
   "userId": 234234234,
}
```

#### **GET** request on `URL/user/:userId`:
Response body:
```json
{
   "accountName": "Bob",
   "age": 37,
   "sex": "m",
   "weight": 201,
   "rdaPreferences": [
      { "nutrientName": "vitamin a", "nutrientType": "vitamin", "rda": 200, "amount": 20, "unit": "mg" },
      { "nutrientName": "polyunsaturated", "nutrientType": "fat", "rda": 150, "amount": 30, "unit": "g" },
   ],
   "macroPreferences": [
      { "nutrientType": "fat", "rda": 200, "amount": 30, "unit": "g", "caloriePercentage": 0.33 },
   ],
}
```

