/** @jsx React.DOM */
var $ = require('jquery')
var Grid = require('./Grid.jsx');
var getSource = function (){
	var path = '/commands',
		steps = [{key: 'I', x: 5, y: 6},
		         {key: 'L', x: 2, y: 3, c1: 'A'},
				 {key: 'F', x: 3, y:3, c1: 'J'},
				 {key: 'V', x: 2, y:3, y1: 4, c1: 'W'},
				 {key: 'H', x: 3, x1:4, y: 2, c1: 'Z'}];
		
	return steps.map(function(step) {	
		var source =  null;	 
		$.each(Object.keys(step), function(idx,key) {
			source = !source ? path + "?" : source + "&"
  			source += key+"="+step[key]
		});
		return source;
	});
}


React.renderComponent(	
	<Grid source={getSource()}/>,
    document.body
);

