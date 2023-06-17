# BadgeButton


The `BadgeButton` class is a subclass of `UIButton` in the UIKit framework. It provides functionality for displaying a badge on top of a button.

## Properties

### `badgeColor` (UIColor)

The color of the badge dot. By default, it is set to `UIColor.red`.

### `badgeVisible` (Bool)

Determines whether the badge dot is visible or hidden. By default, it is set to `false`.

### `badgeValue` (String)

The value displayed inside the badge dot. By default, it is an empty string.

## Methods

### `layoutSubviews()`

This method is called when the layout of the button's subviews needs to be updated. It creates the badge dot view and positions it on the button.

### `createBadgeLabel()`

Creates the label inside the badge dot view and sets its text to the `badgeTitle` value. It adjusts the label's size and centers it within the badge dot.

### `createBadgeDotView()`

Creates the badge dot view, sets its background color, and applies a circular shape with a radius of half the `badgeDotSize`.

### `positionBadgeDotView()`

Positions the badge dot view relative to the button's bounds and adjusts its visibility based on the `badgeVisible` property.

## Usage
```
let badgeButton = BadgeButton(type: .custom)
badgeButton.frame = CGRect(x: 100, y: 100, width: 100, height: 40)
badgeButton.setTitle("Button", for: .normal)
badgeButton.backgroundColor = .blue

// Customize badge properties
badgeButton.badgeVisible = true
badgeButton.badgeColor = .red
badgeButton.badgeValue = "5"

// Add target action
badgeButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

// Add to view
view.addSubview(badgeButton)
```
