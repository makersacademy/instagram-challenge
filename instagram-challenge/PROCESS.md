## Regexp 

https://www.regular-expressions.info/email.html

![](pictures/regexp.png)
`/\S*@[a-z]*\.[a-z]{2,30}([a-z]|\.[a-z]{2,30})/`

- What  about capital letters 
  - research - capital letters are irrelevant 
![](pictures/regexp_case_insensitive.png)
`/\S*@[a-z]*\.[a-z]{2,30}([a-z]|\.[a-z]{2,30})/i`