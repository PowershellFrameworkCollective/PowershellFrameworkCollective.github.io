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