cui
---
practical löve ui library.

![](https://ftp.cass.si/s0=Ymz021.png)

_cui_ is written in MoonScript and requires the [compiler](https://moonscript.org/#installation) to process into Lua for use with LÖVE.  
To see cui in action, use the executable from the base directory:

```
./run.sh -c
```

Table of Contents
=================

- [_cui_](#)
	- [Font]()
	- [Style]()
	- [Generic]()
		- [Parameters]()
			- [`x`,`y`,`w`,`h`]()
			- [`state`]()
			- [`style`]()
			- [`events`]()
			- [`isParent`]()
		- [Functions]()
			- [`drillState(state)`]()
			- [`getWorldPosition!`]()
			- [`detectHover(x,y,w,h)`]()
			- [`setState({key:value})`]()
	- [Container]()
		- [Parameters]()
			- [`children`]()
			- [`selectedElement`]()
		- [Functions]()
			- [`mousepressed(x,y,button)`]()
			- [`mousemoved(x,y,dx,dy)`]()
			- [`keypressed(k)`]()
			- [`keyreleased(k)`]()
			- [`getAllElements!`]()
			- [`getElementById(id)`]()
			- [`getChildren!`]()
	-  [Row]()
		- [Functions]()
			- [`instantiate`]()
	-  [Column]()
		- [Functions]()
			- [`instantiate`]()
	- [Child]()
		- [Parameters]()
			- [`parent`]()
			- [`key`]()

- [Components]()
	- [Text]()
	- [Button]()
	- [TextInput]()
	- [CheckBox]()
	- [Image]()
	- [Slider]()
	- [Drawable]()

### Text
### Button
### TextInput
### CheckBox
### Image
### Slider
### Drawable