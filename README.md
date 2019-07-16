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

1. Drag in a Table View Controller
2. Embed that TVC in a Navigation Controller
3. Set the navigation bar to show large titles
4. Give the TVC a title of "Grail Diary"
5. Set the table view to show 60 pt rows (row height)
6. Drag 3 labels into the cell prototype
7. Give one a value of "location", one "country", and the last one "# of clues"
8. Change the text styles for the three labels to emphasize the location primarily
9. Select the location and country labels and embed them in a vertical stackview
10. Give the stackview an alignment of `leading` and a distribution of `fill`
11. Add the following constraints to the stackview: vertical centering in the cell and margin-based leading of 0
12. Add the following constraints to the clues label: vertical centering in the cell and margin-based trailing of 0
13. Add a constraint between the stackview and the clues label of horizontal spacing; Change the relationship to >= and the value to 8
14. Add a bar button item to the right side of the navigation bar and set the system item value to "Add"
15. Drag a view controller scene onto the canvas
16. Control-click from the add bar button item to the new scene; choose "present modally" for the segue kind and use "AddPOIModalSegue" for the identifier
17. Drag 5 text fields into the new view controller scene; use these placeholders: "Location", "Country", "Clue 1", "Clue 2", "Clue 3"
18. Place the 5 text fields into a vertical stackview and use "fill" for both alignment and distribution, spacing = 16
19. Add the following constraints to the stackview: leading = 20, trailing = 20, top = 20
20. Insert a label into the top of the stackview and give it a value of "New POI"
21. Insert a label above the first clue textfield in the stackview and give it a value of "Clues"
22. Add a toolbar to the bottom of the scene
23. Constrain the toolbar to the leading, bottom, and trailing of the view with 0 space
24. Add 3 bar button items: 1 set to "cancel", 1 to "save" and one flexible space; this should separate the two buttons to the left and right edges
25. Drag in a view controller scene to the canvas
26. Control-drag from the location cell to the new scene; select "show" for the segue kind and enter "ShowPOIDetailSegue" for the identifier
27. Drag 3 labels into the new scene
28. Set one to "Location Name" and constrain it to the upper right corner of the view
29. Place another one below that and set it to "Country"; constrain it so that its trailing edge aligns with the location label, and there's some vertical spacing between them
30. Drag an ImageView into the scene
31. Constrain it with the following: 1:1 aspect ratio, width = 150, leading and top to the view = 20
32. Place the third label below and leading aligned with the image view; set the value to "Clues"
33. Drag a textview into the canvas
34. Constrain it below the "Clues" label and leading aligned with it; add margin-based trailing and bottom constraints of 20