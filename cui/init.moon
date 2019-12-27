cui = {
  _VERSION: 		'cui v0.2'
  _DESCRIPTION: 'practical oo löve ui library'
  _URL: 				'https://gitlab.com/cxss/cui'
  _LICENSE: 		'mit'
  
  Generic:      require(... .. ".base.Generic")
  Font:					require(... .. ".base.Font")
  Style: 				require(... .. ".base.Style")
  Container:		require(... .. ".base.Container")
  Row:					require(... .. ".base.Row")
  Column:				require(... .. ".base.Column")
  Child:				require(... .. ".base.Child")

  Text:					require(... .. ".components.Text")
  Image:        require(... .. ".components.Image")
}

return cui