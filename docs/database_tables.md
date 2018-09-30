## Database Tables

User Accounts

```
| id | first name | last name |  email  | password | created at |
-----------------------------------------------------------------
| 1  |  Malachy   | Gilchrist | x@z.com | ******** |  datetime  |
| 2  |  Another   |   User    | y@z.com | ******** |  datetime  |
```

Photographs

```
| id | user_id | aws_key  | uploaded_at |
-----------------------------------------
| 1  |   1     |  .....   |  datetime   |
| 2  |   1     |  .....   |  datetime   |
```


Photo Comments
```
| id | photo_id | user_id | text | created at | updated at |
------------------------------------------------------------
| 1  |    4     |    3    | ".." |  datetime  |  datetime  |
| 2  |    7     |    1    | ".." |     "      |     "      |
```

Photo Likes
```
| photo_id | user_id |
----------------------
|    1     |    8    |
|    1     |    3    |
|    3     |    6    |
```

## Bonus Tables

Tags
```
| id | tag text |
-----------------
| 1  | 'yolo'   |
| 2  | 'beach'  |
```

Tag Joiner
```
| photo_id | tag_id |
---------------------
|    1     |    1   |
|    1     |    2   |
```
