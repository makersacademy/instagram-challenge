## Classes

* User
* Photograph
* Comment
* Like?

## Class Responibilities and Collaborators

### User
```
| Responsibility | Collaborator |
|-------------------------------|
| Email          |              |
| Id             |              |
| Name           |              |
| Password       |              |
| Register       |              |
| Log in/out     |              |
| Upload Photo   |              |
| Comment Photo  |              |
| Like Photo     |              |
```

### Photograph
```
| Responsibility | Collaborator |
|-------------------------------|
| Owner          | User         |
| Tags           |              |
| Comments       |              |
| Likes          |              |
```

### Comment
```
| Responsibility            | Collaborator |
|---------------------------|--------------|
| Text                      | User         |
| Photo the comment is for  | Photo        |
| User who made the comment |              |
```

### Likes
```
| Responsibility         | Collaborator |
|------------------------|--------------|
| Photo the like is for  | User         |
| User who made the like | Photo        |
```

## Bonus Feature

### Tags
```
| Responsibility         | Collaborator |
|------------------------|--------------|
| Text                   | Photo        |
| Photo tag is for       |              |
```


