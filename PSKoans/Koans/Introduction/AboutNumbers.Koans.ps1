using module PSKoans
[Koan(Position = 103)]
param()
<#
    Numbers

    In PowerShell, we can use many different data types to represent numbers. All differ slightly in
    what they can and can't do. The two most common ones are:

        Integers
            Represent whole numbers. This is the default numeric data type that PowerShell uses
            for whole numbers

        Doubles
            Represents numbers with decimal places or exponent. This is the default numeric type that PowerShell
            will use for numbers entered with decimal places or exponents, for example: 0.5 or 2e3

    So 10 will be an integer and 10.0 will be a double. The examples below display some of the differences
    inherent to the numeric types.
#>

Describe 'Basic Number Types' {

    Context 'Double' {

        It 'can result from an operation involving multiple types of numbers' {

            $Int = 10
            $Double = 10.0

            'System.____' | Should -Be $Int.GetType().Fullname
            'System.____' | Should -Be $Double.GetType().Fullname

            $Result = $Int * $Double
            # What type results when you multiply integers and doubles?
            'System.____' | Should -Be $Result.GetType().Fullname
        }
    }

    Context 'Integers' {

        It 'has to be a whole number' {

            $Pi = [Math]::PI
            function Get-Number() {
                param([parameter(mandatory = $true)][Int]$Int)
                $Int
            }

            'System.____' | Should -be $Pi.GetType().Fullname
            # What number will return if you pass Pi into an int function?
            ___ | Should -Be (Get-Number -Int $Pi)
        }
    }
}

Describe "Banker's Rounding" {

    It 'rounds to nearest even number on .5' {

        # Try and guess how PowerShell will round these numbers
        ____ | Should -Be ([Int32]2.5)
        ____ | Should -Be ([Int32]3.34)
        ____ | Should -Be ([Int32]10.61)
        ____ | Should -Be ([Int32]12.7)
        ____ | Should -Be ([Int32]5.5)

    }
}
