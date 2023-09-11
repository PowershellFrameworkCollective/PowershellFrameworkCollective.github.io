# Path Parameter Classes

[Back to Parameter Classes](https://psframework.org/documentation/documents/psframework/parameter-classes.html)

## Synopsis

The set of parameter classes about the path system, serve to validate and resolve file system path inputs.
They vastly simplify path processing inside of your commands.

## Description

Usually, when accepting a path - in order to process input files for example - we need to ensure the path(s) provided actually exist and are of the expected type (e.g. file or folder).
Then we need to resolve each path, which might resolve to multiple files or folders which we then need to safely enumerate.
Example:

```powershell
function Get-FileContent {
	[CmdletBinding()]
	param (
		[string[]]
		$Path
	)

	foreach ($entry in $Path) {
		try { $resolvedPaths = Resolve-Path -Path $entry -ErrorAction Stop }
		catch {
			Write-Error $_
			continue
		}

		foreach ($resolvedPath in $resolvedPaths) {
			if (-not (Test-Path -Path $resolvedPath -PathType Leaf)) {
				Write-Warning "Not a file: $resolvedPath"
				continue
			}

			# Do Something
		}
	}
}
```

If we also want to support `-LiteralPath` then this becomes so much more complex.
with this parameter class, the same code however can be condensed to ...

```powershell
function Get-FileContent {
	[CmdletBinding()]
	param (
		[PsfFile]
		$Path
	)

	foreach ($filePath in $Path) {
		# Do Something
	}
}
```

Adding support for `-LiteralPath` is no harder:

```powershell
function Get-FileContent {
	[CmdletBinding()]
	param (
		[PsfFile]
		$Path,

		[PsfLiteralPath]
		$LiteralPath
	)

	foreach ($filePath in $Path + $LiteralPath) {
		# Do Something
	}
}
```

## Creating a new file

Sometimes we need to provide a path to a file that does not yet exist - for example, let's say our new command needs to write a report file somewhere.
In that case, the folder should already exist, but the file usually would not.
In the previous example however, we require the file to already exist!

For this scenario, there exists the `[PsfNewFile]` parameter class, which allows for a file to not yet exist, so long as the parent folder does:

```powershell
function Export-SystemReport {
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true)]
		[PsfNewFile]
		$OutPath
	)

	# Do Something
	# ...

	$results | Export-PSFClixml -Path $OutPath
}
```

## Being Lax

One of the concerns with the new approach, is that any bad input will fail the command during input validation.
There is no inherent ability to just skip it and move to the next item.

For this, each path parameter class other than the `[PsfNewFile]` variant comes with a "-Lax" variant.
This will accept all input without error.

Instead, this variant will have a `FailedInput` property, listing all the input items that were either not a file or did not resolve to anything:

```powershell
function Get-FileContent {
	[CmdletBinding()]
	param (
		[PsfFileLax]
		$Path
	)

	foreach ($entry in $Path.FailedInput) {
		Write-Warning "Could not resolve as file: $entry"
	}

	foreach ($filePath in $Path) {
		# Do Something
	}
}
```

## The different types

There are 9 different parameter classes that fall under this category:

+ PsfPath: Path to folders or files
+ PsfPathLax: Path to folders or files, will not generate errors on bad input
+ PsfNewFile: Path to a file where at least the folder exists
+ PsfFile: Path to files that exist
+ PsfFileLax: Path to files that exist, will not generate errors on bad input
+ PsfDirectory: Path to folders that exist
+ PsfDirectoryLax: Path to folders that exist, will not generate errors on bad input
+ PsfLiteralpath: Path to folders or files, will not use wildcard interpretation.
+ PsfLiteralpathLax: Path to folders or files, will not use wildcard interpretation. Will not generate errors on bad input

[Back to Parameter Classes](https://psframework.org/documentation/documents/psframework/parameter-classes.html)