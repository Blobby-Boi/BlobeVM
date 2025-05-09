I've analyzed your code. This is a Textual application for installing BlobeVM with a choice of parameters. Here are the main comments and possible improvements.:

Problems and recommendations:

Button mismatch:
The InstallApp has a check for id="cancel", but there is no such button in the interface.
In InstallScreen, the "Back" button uses error style, which can be misleading.

CSS Styles:
CSS_PATH = "installer.tcss" is specified, but there is no information about the contents of this file.
Check if the style file exists and if it is connected correctly.

Data processing:
The savejson() function does simple string replacement, which can be unreliable for complex JSON
It is better to use the standard json module.:

python
import json

def savejson(data):
    with open('options.json', 'w') as f:
        json.dump(data, f, indent=2)

Code structure:
Global variables Head and InstallHead can be made constants of the class
It is better to define LINES inside the InstallScreen class

Safety:
There is no verification of the existence of the options file.json
There is no record error handling

Application logic:
After saving the JSON, app.exit() is immediately called - this will terminate the application.
It might be worth adding a confirmation or installation status.

The code as a whole should work under the condition:
All dependencies are installed (Textual)
There is an installer.tcss style file
Python version 3.7+

Tips for improvement:
Add error handling
Realize the installation progress
Add a check to select at least one option.
Use logging instead of print
Add docstrings for classes and methods

I hope this will help you.