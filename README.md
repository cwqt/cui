cui
---
practical löve ui library.

To see cui in action, open the demo with LÖVE from the base directory:

```
love .
```

Table of Contents
==============

- [cui](#)
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
			- [`getWorldPosition()`]()
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
