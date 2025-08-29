# PSFHashtables

[Back to utility](http://psframework.org/documentation/documents/psframework/utility.html)

## Synopsis

PSFramework Hashtables - `[PsfHashtable]` - are an extension / improvement over the default `[Hashtable]`.
They can do everything a regular hashtable can do, but they can also offer alternative options on what to do, when asking for a key _not_ already included in the hashtable.

## Description

The `[PsfHashtable]` data-type was added as a means to make hashtables more powerful and flexible, in many cases replacing the need for switch-statements.
This can help simplify the code layout significantly.

> Example: The simple hashtable

```powershell
$organizations = @{
	LondonHR = 'London'
	LondonSales = 'London'
	LondonDev = 'London'
	NewYorkHR = 'New York'
	NewYorkSales = 'New York'
	NewYorkDev = 'New York'
}

$users | Select-Object Name, Mail, @{
	Name = 'Users'
	Expression = {
		if ($organizations[$_.Organization]) {
			$organizations[$_.Organization]
		}
		else { $_.Organization}
	}
}
```

> Example: PsfHashtable

```powershell
$organizations = [PsfHashtable]@{
	LondonHR = 'London'
	LondonSales = 'London'
	LondonDev = 'London'
	NewYorkHR = 'New York'
	NewYorkSales = 'New York'
	NewYorkDev = 'New York'
}
# If key not known: Return key
$organizations.EnablePassthru()

$users | Select-Object Name, Mail, @{
	Name = 'Users'
	Expression = { $organizations[$_.Organization] }
}
```

## Special Features

So, after luring you in with a simple example, what all can the `[PsfHashtable]` do for you?

### PassThru

As shown in the previous example, a `[PsfHashtable]` can be configured to pass through the key, if it is not yet known:

```powershell
$mapping = [PsfHashtable]@{
	Answer = 42
	Conspiracy = 23
}
$mapping.EnablePassthru()

$mapping["Answer"] # 42
$mapping.Answer # 42
$mapping["Foo"] # Foo
$mapping.Foo # <nothing>
```

> Note: One limitation with extending hashtables: The features on unknown keys _only_ work, when using the _index_ notation (e.g. `$mapping["Foo"]`), not the _property_ notation (e.g. `$mapping.Foo`).

### Default Value

Rather than passing through the key, you can also provide a default value to return:

```powershell
$mapping = [PsfHashtable]@{
	Answer = 42
	Conspiracy = 23
}
$mapping.SetDefaultValue(1)

$mapping["Answer"] # 42
$mapping.Answer # 42
$mapping["Foo"] # 1
$mapping.Foo # <nothing>
```

> Note: One limitation with extending hashtables: The features on unknown keys _only_ work, when using the _index_ notation (e.g. `$mapping["Foo"]`), not the _property_ notation (e.g. `$mapping.Foo`).

### Dynamic Value

A third alternative is to provide a custom scriptblock that gets executed on unknown keys:

```powershell
$mapping = [PsfHashtable]@{
	Answer = 42
	Conspiracy = 23
}
$mapping.SetCalculator({ $_ * 2 })

$mapping["Answer"] # 42
$mapping.Answer # 42
$mapping["Foo"] # FooFoo
$mapping.Foo # <nothing>
```

> Note: One limitation with extending hashtables: The features on unknown keys _only_ work, when using the _index_ notation (e.g. `$mapping["Foo"]`), not the _property_ notation (e.g. `$mapping.Foo`).

[Back to utility](http://psframework.org/documentation/documents/psframework/utility.html)