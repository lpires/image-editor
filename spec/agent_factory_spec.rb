require 'spec_helper'

describe AgentFactory do 
	# describe 'Action - create new map' do
	# 	create_map = Proc.new do |params|
	# 		MapAction.send(create_map(params[:m], params[:n], params[:value])
	# 	end
		
	# 	it 'should create a new table 5*6' do
	# 		x_size, y_size, value = 5, 6, :O

	# 		create_map_action = AgentFactory.create(:create_matrix, method, rules, description, create_map)
	# 		expect(create_map_action.kind_of? Agent).to be(true)
	# 		map = create_map_action.exec({:m=>y_size, :n=>x_size, :value=>value})
	# 		expect(map.row_count).to eq(y_size)
	# 		expect(map.column_count).to eq(x_size)
	# 	end

	# end

	# describe 'Action - clean map' do
	# 	clean_map = Proc.new do |params|
	# 		MapAction::create_map(params[:map].row_count, params[:map].column_count)
	# 	end

	# 	it '' do
	# 		map, map_0 = Matrix.build(6, 5) {:X}, Matrix.build(6, 5) {:O}

	# 		clean_map_action = AgentFactory.create(:clean_map, clean_map)
	# 		expect(clean_map_action.kind_of? Agent).to be(true)

	# 		map = clean_map_action.exec({:map=>map})
	# 		expect((map.to_a - map_0.to_a).empty?).to be(true)
	# 	end

	# end

	# describe 'Action - position cell' do
	# 	position_cell = Proc.new do |params|
	# 		MapAction::position params[:map], params[:x], params[:y], params[:value]
	# 	end

	# 	it 'should position the :A on x,y' do 
	# 		x, y, map = 2, 3, Matrix.build(6, 5) {:O}

	# 		position_map_action = AgentFactory.create(:position_cell, position_cell)
	# 		expect(position_map_action.kind_of? Agent).to be(true)

	# 		map = position_map_action.exec({:x=>x, :y=>y, :map=>map, :value=>:A})
	# 		expect(map[x,y]).to be(:A)
	# 	end
	# end

	# describe 'Action - vertical move' do
	# 	vertical_move = Proc.new do |params|
	# 		MapAction::position params[:map], params[:x], params[:y0], params[:value]
	# 	end
	# end

	# describe 'Action - horizontal move' do

	# end

	# describe 'Action - fill region' do

	# end

	# describe 'Action - show grid' do

	# end
end
