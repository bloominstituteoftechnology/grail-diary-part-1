# Grail Diary Part 1 - Auto Layout

A student that completes this project shows that they can:

- understand and explain what Auto Layout is, and the problems it solves
- implement common layouts using constraints in Interface Builder
- implement common layouts using UIStackView

## Introduction

Grail Diary is an app that allows the user to track locations of interest (POIs) and useful clues about those locations.

## Instructions

Please fork and clone this repository. Create a new Xcode project inside of the cloned repository. Use the single view app template and name it "GrailDiary"

### Storyboard Tasks

#### List of Clues View

#### Add New POI View


#### POI Detail View

35. Find a square image of an interesting location on Google and drag it into your asset catalog; set a sensible name and set the name as the image in the Image View attributes
36. Add a horizontal distance constraint between the location label and the Image View
    * set the constant value to `8`
    * make it a `>=` constraint
37. Add a horizontal distance constraint between the country label and the Image View
    * set the constant value to `8`
    * make it a `>=` constraint
38. Place the third label below; set the value to "Clues"; use the following constraints:
    * align the leading with the Image View
    * set a top distance to the Image View = `40`
39. Drag a text view into the canvas
40. Constrain it below the clues label with the following:
    * leading alignment with clues label
    * vertical distance of `8`
    * relate the text view and the "Country" label by aligning their trailing values
    * bottom to view = `20`

## Complete Storyboard Preview

![preview-image](https://raw.githubusercontent.com/LambdaSchool/grail-diary-part-1/master/storyboard-complete.png)
