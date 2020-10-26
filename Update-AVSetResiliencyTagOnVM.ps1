<#
.SYNOPSIS
This script updates the tags of the resourcce

.DESCRIPTION
This script updates the tags of the resourcce

.PARAMETER ResourceId
Parameter The Resource Id of the resource for which the tag needs to be updated.

.PARAMETER TagName
Parameter The tag name to be updated on the resource.

.PARAMETER TagValue
Parameter The tag value to be updated on the resource.
.EXAMPLE
An example

.NOTES
General notes
#>
function Update-AVSetResiliencyTag {
    [CmdletBinding()]
    param (
        # The resource ID of the resource that is to be udpated with the tag
        [Parameter(Mandatory)]
        [string]
        $ResourceId,
        # The tag name to be added
        [Parameter(Mandatory)]
        [string]
        $TagName,
        # The tag value to tbe added
        [Parameter(Mandatory)]
        [string]
        $TagValue        
    )  
    process {
        try {
            $MergedTags = @{$TagName = $TagValue }
            Write-Host "Updating resource $ResourceId with tags $($MergedTags | ConvertTo-Json)"
            Update-AzTag -ResourceId $ResourceId -Tag $MergedTags -Operation Merge
            Write-Host "Successfully merged the tags."
        }
        catch {
            Write-Host "An error occurred while updating the resource. $($_ | ConvertTo-Json -Depth 100)"
        }        
    }
}

