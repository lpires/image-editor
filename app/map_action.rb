require 'matrix'

class Matrix
 	def []=(i, j, x)
   		@rows[i][j] = x
  	end
end

module MapAction
	DEFAULT_CELL_VALUE = :O

	def self.create_map params
    return params[:grid] if(params[:exec])
    params[:exec] = true
		x, y = params[:x], params[:y]
		value = (params.has_key? :c1) ? params[:c1] : DEFAULT_CELL_VALUE 
		Matrix.build(y, x) {value}
	end 

	def self.position params
		x, y = params[:x], params[:y]
		value = (params.has_key? :c1) ? params[:c1] : DEFAULT_CELL_VALUE
		params[:grid].[]= y-1, x-1, value
		params[:grid]
	end

	def self.show_map params
    return params[:grid] if(params[:exec])
    params[:exec] = true
	end
end