# planet_widget

<a href="https://github.com/Mindinventory/planet_widget/stargazers">
<img src="https://img.shields.io/github/stars/Mindinventory/planet_widget?style=social" alt="planet_widget Git Stars">
</a>
<a href="https://developer.android.com" style="pointer-events: stroke;" target="_blank">
<img src="https://img.shields.io/badge/platform-android-blue">
</a>
<a href="https://developer.apple.com/ios/" style="pointer-events: stroke;" target="_blank">
<img src="https://img.shields.io/badge/platform-iOS-blue">
</a>
<a href="" style="pointer-events: stroke;" target="_blank">
<img src="https://img.shields.io/badge/platform-Linux-blue">
</a>
<a href="" style="pointer-events: stroke;" target="_blank">
<img src="https://img.shields.io/badge/platform-Mac-blue">
</a>
<a href="" style="pointer-events: stroke;" target="_blank">
<img src="https://img.shields.io/badge/platform-web-blue">
</a>
<a href="" style="pointer-events: stroke;" target="_blank">
<img src="https://img.shields.io/badge/platform-Windows-blue">
</a>
<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="MIT License"></a>

Planet widget, It is fully customizable package which allow you to set custom widget in circular manner.  It has provision for moving like solar system. There is customizable properties like speed of each round, round color, position of planet etc.


### Planet Widget.
![Planet Widget](https://github.com/Mindinventory/planet_widget/blob/master/assets/planet_widget.gif)

## Usage

### Example
    PlanetWidget(
                  defaultCircleStrokeWidth: 0.2,
                  defaultCircleStrokeColor: Colors.white,
                  startAnimation: true,
                  repeatAnimation: true,
                  firstCircleAnimationDuration: 5000,
                  secondCircleAnimationDuration: 7000,
                  thirdCircleAnimationDuration: 10000,
                  centerWidget: Image.asset(
                    CENTER_IMAGE,
                    width: 96,
                    height: 96,
                  ),
                  firstCircleWidgets: [],
                  secondCircleWidgets: [],
                  thirdCircleWidgets: [],
                )


### Parameters

##### visibleFirstCircle:
- Visibility of first circle.
- It contains bool value.
- true = visible,
- false = invisible.

##### visibleSecondCircle:
- Visibility of second circle.
- It contains bool value.
- true = visible,
- false = invisible.

##### visibleThirdCircle:
- Visibility of third circle.
- It contains bool value.
- true = visible,
- false = invisible.

##### firstCircleRadius:
- Displays the first circle based on radius.
- Radius starts from center.
- It contains the double value.

##### secondCircleRadius:
- Displays the second circle based on radius.
- Radius starts from center.
- It contains the double value.

##### thirdCircleRadius:
- Displays the third circle based on radius.
- Radius starts from center.
- It contains the double value.

##### firstCircleRadians:
- Displays the first circle widgets based on radians calculation.
- It contains the double value.

##### secondCircleRadians:
- Displays the second circle widgets based on radians calculation.
- It contains the double value.

##### thirdCircleRadians:
- Displays the third circle widgets based on radians calculation.
- It contains the double value.

##### firstCircleWidgets:
- Displays the first circle widgets.
- It contains the List of Widgets.

##### secondCircleWidgets:
- Displays the second circle widgets.
- It contains the List of Widgets.

##### thirdCircleWidgets:
- Displays the third circle widgets.
- It contains the List of Widgets.

##### centerWidget:
- Displays the widget at center of circle.
- It contains the Widget.

##### defaultCircleStrokeColor:
- Change the all circles stroke(line) color.
- It contains **Color** value.
- Default value is `Colors.black`

##### firstCircleStrokeColor:
- Change the first circle stroke(line) color.
- It contains **Color** value.
- Default value is `Colors.black`

##### secondCircleStrokeColor:
- Change the second circle stroke(line) color.
- It contains **Color** value.
- Default value is `Colors.black`

##### thirdCircleStrokeColor:
- Change the third circle stroke(line) color.
- It contains **Color** value.
- Default value is `Colors.black`

##### defaultCircleStrokeWidth:
- Change the all circles stroke(line) width.
- It contains **double** value.
- Default value is `1.0`

##### firstCircleStrokeWidth:
- Change the first circle stroke(line) width.
- It contains **double** value.
- Default value is `1.0`

##### secondCircleStrokeWidth:
- Change the second circle stroke(line) width.
- It contains **double** value.
- Default value is `1.0`

##### thirdCircleStrokeWidth:
- Change the third circle stroke(line) width.
- It contains **double** value.
- Default value is `1.0`

##### startAnimation:
- Create the animation in **Planet Widget**.
- It contains **bool** value:
- `true` = display the planets with animation
- `false` = display the planets without animation

##### repeatAnimation:
- Repeat the animation in **Planet Widget**.
- This parameter affects when **[startAnimation]** is true.
- It contains **bool** value.
- `true` = repeat the animation.
- `false` = show animation only for one time.

##### defaultCircleAnimationDuration:
- Set the animation duration in milliseconds for all circles.
- This parameter affects when **[startAnimation]** is true.
- It contains **int** value.

##### firstCircleAnimationDuration:
- Set the animation duration in milliseconds for the first circle.
- This parameter affects when **[startAnimation]** is true.
- It contains **int** value.

##### secondCircleAnimationDuration:
- Set the animation duration in milliseconds for the second circle.
- This parameter affects when **[startAnimation]** is true.
- It contains **int** value.

##### thirdCircleAnimationDuration:
- Set the animation duration in milliseconds for the third circle.
- This parameter affects when **[startAnimation]** is true.
- It contains **int** value.

##### curve:
- **[Curves],** a collection of common animation easing curves.
- **[CurveTween]**, which can be used to apply a [Curve] to an **[Animation]**.
- Default value is `Curves.linear`



## Guideline for contributors
Contribution towards our repository is always welcome, we request contributors to create a pull request to the develop branch only.

## Guideline to report an issue/feature request
It would be great for us if the reporter can share the below things to understand the root cause of the issue.
- Library version
- Code snippet
- Logs if applicable
- Device specification like (Manufacturer, OS version, etc)
- Screenshot/video with steps to reproduce the issue

# LICENSE!
Planet Widget is [MIT-licensed](https://github.com/Mindinventory/planet_widget/blob/master/LICENSE "MIT-licensed").

# Let us know!
We’d be really happy if you send us links to your projects where you use our component. Just send an email to sales@mindinventory.com And do let us know if you have any questions or suggestion regarding our work.
