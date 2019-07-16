# Grail Diary Part 1 - Auto Layout

A student that completes this project shows that they can:

- understand and explain what Auto Layout is, and the problems it solves
- implement common layouts using constraints in Interface Builder
- implement common layouts using UIStackView

## Introduction

Grail Diary is an app that allows the user to track locations of interest (POIs) and useful facts about those locations.

## Instructions

Please fork and clone this repository. Create a new Xcode project inside of the cloned repository.

### Storyboard Tasks

1. Rename the View Controller to "CluesTableViewController" with the refactor->rename option in the source code file
2. Drag in a table view to that view controller scene in the storyboard
3. Embed that scene in a Navigation Controller
4. Set the navigation bar to show large titles
5. Give the view controller scene a title of "Grail Diary"
6. Set the table view to show 60 pt rows (row height)
7. Drag 3 labels into the cell prototype
8. Give one a value of "location", one "country", and the last one "# of clues"
9. Change the text styles for the three labels to emphasize the location primarily
10. Select the location and country labels and embed them in a vertical stackview
11. Give the stackview an alignment of `leading` and a distribution of `fill`
12. Add the following constraints to the stackview: vertical centering in the cell and margin-based leading of 0
13. Add the following constraints to the clues label: vertical centering in the cell and margin-based trailing of 0
14. Add a constraint between the stackview and the clues label of horizontal spacing; Change the relationship to >= and the value to 8
15. Add a bar button item to the right side of the navigation bar and set the system item value to "Add"
16. Drag a view controller scene onto the canvas
17. Control-click from the add bar button item to the new scene; choose "present modally" for the segue kind and use "AddPOIModalSegue" for the identifier
18. Drag 5 text fields into the new view controller scene; use these placeholders: "Location", "Country", "Clue 1", "Clue 2", "Clue 3"
19. Place the 5 text fields into a vertical stackview and use "fill" for both alignment and distribution, spacing = 16
20. Add the following constraints to the stackview: leading = 20, trailing = 20, top = 20
21. Insert a label into the top of the stackview and give it a value of "New POI"
22. Insert a label above the first clue textfield in the stackview and give it a value of "Clues"
23. Add a toolbar to the bottom of the scene
24. Constrain the toolbar to the leading, bottom, and trailing of the view with 0 space
25. Add 3 bar button items: 1 set to "cancel", 1 to "save" and one flexible space; this should separate the two buttons to the left and right edges
26. Drag in a view controller scene to the canvas
27. Control-drag from the location cell to the new scene; select "show" for the segue kind and enter "ShowPOIDetailSegue" for the identifier
28. Drag 3 labels into the new scene
29. Set one to "Location Name" and constrain it to the upper right corner of the view
30. Place another one below that and set it to "Country"; constrain it so that its trailing edge aligns with the location label, and there's some vertical spacing between them
31. Drag an ImageView into the scene
32. Constrain it with the following: 1:1 aspect ratio, width = 150, leading and top to the view = 20
33. Find a square image of an interesting location on Google and drag it into your asset catalog; set a sensible name and set the name as the image in the imageview attributes
34. Place the third label below and leading aligned with the image view; set the value to "Clues"
35. Drag a textview into the canvas
36. Constrain it below the "Clues" label and leading aligned with it; add margin-based trailing and bottom constraints of 20