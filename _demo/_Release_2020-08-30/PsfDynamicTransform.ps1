class Car {
	[string]$Model
	[int]$PS
	[int]$Speed
}

function Get-CarPlain
{
	[CmdletBinding()]
	param (
		[Car]
		$Car
	)
	$Car
}

function Get-CarShiny
{
	[CmdletBinding()]
	param (
		[PsfDynamicTransform([Car], 'Model', 'PS')]
		[Car]
		$Car
	)
	$Car
}

$car1 = [Car]@{
	Model = "Mercedes"
	PS    = 300
	Speed = 250
}

# Don't paste everything in one go, as defining the same class multiple times in a single script is a syntax error
class Car {
	[string]$Model
	[int]$PS
	[int]$Speed
}

$car2 = [Car]@{
	Model = "BMW"
	PS    = 100
	Speed = 150
}

Get-CarPlain -Car $car1
Get-CarPlain -Car $car2 # Fails, can't convert type Car to type Car

Get-CarShiny -Car $car1
Get-CarShiny -Car $car2 # Works, PsfDynamicTransform doing its job