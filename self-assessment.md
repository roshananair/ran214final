# Automate 
## The entire analysis is automated
### Data reading and cleaning is handled in a standalone script that creates intermediate output(s).
#### NOT YET: Data reading and cleaning creates intermediate outputs, but is in the same script as everything else (spaghetti/scratch).
### The analysis is performed in a Quarto document that reads intermediate outputs.
#### NOT YET: The analysis is all in a spaghetti/scratch script and not yet in a .qmd.
### Files in the R/ folder exclusively define functions and have no other side effects.
#### NOT YET: There are two files in the R folder, one that contains the correct moving average function, and another that needs to be deleted, but both contain functions. 
### All scripts run without errors.
#### NOT YET: The code runs without errors, however it is not in the correct file and has not been completed to run with all four data frames. Unsure if plot is correctly rendering. 
## The analysis produces the expected output
### The Quarto document performs the data analysis (moving average).
#### NOT YET: The .qmd does not contain any code. 
### The Quarto document creates a figure that is a reasonable approximation of the original.
#### NOT YET: The .qmd does not contain any code.
# Organize
## Data are properly organized
### Raw data is contained in its own folder.
#### MEETS SPEC (Partially): All raw data + the .zip file are in the data folder. Need to delete the .zip.
### Outputs are contained in a separate folder from raw data.
#### MEETS SPEC: Outputs (.html) is contained in docs folder. 
## Code is properly organized
### At least one function is defined in a script in R/ and used elsewhere in the workflow.
#### NOT YET: The moving average function is defined in /R and is in the spaghetti/scratch script but is not yet used properly.
### All code in the repo (except in the scratch/ folder) is required for the analysis (i.e., no “safety blanket” code remaining)
#### NOT YET: Not all files in the repo are needed, and there is not a .qmd with code that runs.
# Document
## The repo has an effective README
### A short, but descriptive title
#### A README’s title is set to the repository name by default - change this!
##### MEETS SPEC (Potentially?): Current title is Hurricane effects on stream chemistry.
### A brief explanation of the repository’s purpose
#### Paragraphs or a bulleted list are both acceptable options
#### You may include an image or logo that represents the project
##### NOT YET: There is a draft description that needs revision and no image.
### A concise description of what’s housed in the repository
#### This includes information about the repository structure or file organization
##### NOT YET: No description about what is housed in the repo.
### Details regarding data access
#### Any necessary information on where data lives (e.g. is it housed in the repo, on a server, in a library/package etc.) and how to access it in order to run the code
##### MEETS SPEC: Location of data and data source for download are provided.
### A list of authors or current contributors (for collaborative work)
#### Consider hyperlinking collaborators’ GitHub profiles or other professional profile
##### NOT YET: Name is included but no link to GitHub or professional profile.
### References
#### In an appropriate, consistent format, including links.
#### Don’t forget to add references for datasets too.
##### MEETS SPEC: References with links are standard and included.
## Code follows a professional style
### All code files follow a consistent style (the Air formatter automates this).
#### NOT YET: Air format used but inconsistent commenting and titles etc. Needs revision. 
### The code has an appropriate amount of comments.
#### Comments are minimized by using meaningful variable names and helper functions.
#### Comments are used to explain the why of code, not the what.
##### NOT YET: Code is insufficiently commented and not yet inside .qmd.





