require 'spec_helper'

describe Commander do 
	let(:conf) do
		 JSON.parse(File.read('./config/commands.json'))
	end

	it 'should have a new state' do
		commander = Commander.new conf
		expect(commander.new?).to be(true)
		expect(commander.awaiting_move?).to be(false)
		expect(commander.exit?).to be(false)
	end

	describe '#create!' do
		it 'should have a awaiting move state' do
			commander = Commander.new conf
			commander.create!({:x=>5, :y=>6})
			expect(commander.new?).to be(false)
			expect(commander.awaiting_move?).to be(true)
			expect(commander.exit?).to be(false)
		end

		it 'should have a awaiting move state' do
			commander = Commander.new conf
			commander.create!({:x=>5, :y=>6})
			expect(commander.new?).to be(false)
			expect(commander.awaiting_move?).to be(true)
			expect(commander.exit?).to be(false)
		end
	end

	describe '#move!' do
		it 'should display position (x:2,y:3)' do
			x,y = 2,3
			commander = Commander.new conf
			grid = commander.create!({:x=>5, :y=>6})
			grid = commander.move!(:L, {:grid=> grid, :x=>x, :y=>y, :c1=>:A})
			expect(grid[y-1,x-1]).to eq(:A)
		end

		it 'should display vertical draw' do
			x,y,y1 = 2,3,4
			commander = Commander.new conf
			grid = commander.create!({:x=>5, :y=>6})
			grid = commander.move!(:V, {:grid=> grid, :x=>x, :y=>y, :y1=>y1, :c1=>:W})
			expect(grid[y-1,x-1]).to eq(:W)
			expect(grid[y,x-1]).to eq(:W)
		end

		it 'should display horizontal draw' do
			x,x1,y = 3,4,2
			commander = Commander.new conf
			grid = commander.create!({:x=>5, :y=>6})
			grid = commander.move!(:H, {:grid=> grid, :x=>x, :y=>y, :x1=>x1, :c1=>:Z})
			expect(grid[y-1,x-1]).to eq(:Z)
			expect(grid[y-1,x]).to eq(:Z)
		end

		it 'should fill region' do
			x,y = 3,3
			commander = Commander.new conf
			grid = commander.create!({:x=>5, :y=>6})
			grid = commander.move!(:F, {:grid=> grid, :x=>x, :y=>y, :c1=>:J})
			expect((grid.to_a - [[:J, :J, :J, :J, :J]]).empty?).to be(true)
		end

		it 'should display test example' do
			x,y = 2,3
			commander = Commander.new conf
			grid = commander.create!({:x=>5, :y=>6})
			grid = commander.move!(:L, {:grid=> grid, :x=>x, :y=>y, :c1=>:A})

			x,y = 3,3
			grid = commander.move!(:F, {:grid=> grid, :x=>x, :y=>y, :c1=>:J})

			x,y,y1 = 2,3,4
			grid = commander.move!(:V, {:grid=> grid, :x=>x, :y=>y, :y1=>y1, :c1=>:W})

			x,x1,y = 3,4,2
			grid = commander.move!(:H, {:grid=> grid, :x=>x, :y=>y, :x1=>x1, :c1=>:Z})

			expected = [[:J, :J, :J, :J, :J], [:J, :J, :Z, :Z, :J], [:J, :W, :J, :J, :J], [:J, :W, :J, :J, :J], [:J, :J, :J, :J, :J], [:J, :J, :J, :J, :J]]
			expect((grid.to_a - expected).empty?).to be(true)
		end
	end

	it 'should have a exit state' do
		commander = Commander.new conf
		commander.create!({:x=>5, :y=>6})
		commander.end_session!
		expect(commander.new?).to be(false)
		expect(commander.awaiting_move?).to be(false)
		expect(commander.exit?).to be(true)
	end
end