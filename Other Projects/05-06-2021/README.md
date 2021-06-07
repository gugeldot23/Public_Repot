Rewritten one of the completest projects in python I've done so far, now trying to reduce it and simplify it as much as possible, even though it's no big deal 
this script converts several or 1 images (png or jpg) into a single PDF. 
Older versions where much more stiff, they needed an specific absolute path and nearly no error handling, now I've learned to get absolute paths with os module so you can execute it anywhere. Also tackeled the issue of 0 pages pdfs with some methods of the pikepdf module. 

This project was conceived by me being a bit bothered by the fact I had to upload my files to a web to convert them, without knowing what treatment they did to those files, even worst if the pictures contained personal info. Therefore I decided to create my own rudimentary tool, hope it's useful to you. 

For testing just use "pip install -r requirements.txt" in the folder unzipped and try it out
Written 07/06/2021 by GreyNom
