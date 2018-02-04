# Getting started with String Operators

PSUtil includes a large suite of functions that replace the regular string operators known in PowerShell.

# replace

```
"abc def ghi" | replace "def" "abc"

# returns "abc abc ghi"
```

# Join

```
1..10 | join ","

# returns "1,2,3,4,5,6,7,8,9,10"
```

# Format

```
1..3 | format "192.168.2.{0}"

# returns "192.168.2.1","192.168.2.2","192.168.2.3"
```

# trim

```
" abc def " | trim " af"

# return "bc de"
```

# split

```
"abc|def|ghi" | split "|"

# returns "abc", "def", "ghi"
```

# wrap

```
1..5 | wrap '"' '"'

# returns '"1"', '"2"', '"3"', '"4"', '"5"'

# Additional Information

 - Several of the commands can switch between using Regular Expression and literal execution.

# Further reading

```
Content pending
```