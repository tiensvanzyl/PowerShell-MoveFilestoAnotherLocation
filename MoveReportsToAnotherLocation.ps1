###################################################################################################################################################################################### 
# Exchange 2010 Exchange Quota Report 
# Author: Tiens van Zyl
# Date 20 November 2015
# Updated by Tiens van Zyl 30 March 2016
# Updates: Removed line 1 as the batch file errored out.
# Updates: Expanded comments section.
# This script moves files older than today's date to another location 
# 1. Lines 15 to 17 contains the code to move files from one folder to another or one server to another server.
# 2. Line 15: Get's the path of the folder or document you want to move.
# 3. Line 16: Checks for files older than today's date and will move/copy them to the location specified on Line 17.
# 4. Line 17: Moves items in the path specified in Line 16 to the location specified after -destination.
# 5. Copy the code in Lines 15 to 17 and edit it to use different file paths or locations. 
# 6. The 2nd block of code moves files older than 60 days from today's date.
# 7. You use this code at your own risk. Please always test with test files and paths before using this script in production. Always make sure you have reliable backups.
######################################################################################################################################################################################
get-childitem -Path "C:\Source\Folder\" |
    where-object {$_.LastWriteTime -lt (get-date).AddDays(-1)} | 
    move-item -destination "\\ServerName\d$\Destination\Folder"


get-childitem -Path "C:\Source\Folder\" |
    where-object {$_.LastWriteTime -lt (get-date).AddDays(-60)} | 
    move-item -destination "C:\TargetDestination\Folder\"
