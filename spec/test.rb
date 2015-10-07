require_relative 'spec_helper'

describe Building do

  before :each do
    @barracks = Barracks.new
  end

  it "should be a building" do
    expect(@barracks).to be_an_instance_of(Barracks)
    expect(@barracks).to be_a(Building)
  end

  it "should have 500HP" do
    expect(@barracks.health_points).to eq(500)
  end

  it "should have 500 lumber" do
    expect(@barracks.lumber).to eq(500)
  end

end

describe Footman do

  before :each do
    @footman = Footman.new
  end

  it "should only do 50% damage on buildings" do
    @barracks = Barracks.new
    expect(@barracks).to receive(:damage).with(5)
    @footman.attack!(@barracks)
  end

end

describe Unit do

  before :each do
    @unit = Unit.new(10, 10)
  end

  it "should be able to tell you if the unit is dead or not" do 
    expect(@unit.dead?).to eq(false)
  end

  it "should be dead when HP = 0" do
    @unit.attack!(@unit)
    expect(@unit.dead?).to eq(true)
  end

  it "should not be able to attack when dead" do
    @unit.attack!(@unit)
    expect(@unit.attack!(@unit)).to eq("You cannot attack, you are dead!")
  end

end

describe SeigeEngine do

  before :each do
    @seige_engine = SeigeEngine.new
    @barracks = Barracks.new
  end

  it "should have 50 attack power" do
    expect(@seige_engine.attack_power).to eq(50)
  end

  it "should have 400 health points" do
    expect(@seige_engine.health_points).to eq(400)
  end

  it "costs 200 gold" do
    @barracks.train_seige_engine
    expect(@barracks.gold).to eq(800)
  end

  it "costs 3 food" do
    @barracks.train_seige_engine
    expect(@barracks.food).to eq(77)
  end

  it "costs 60 lumber" do
    @barracks.train_seige_engine
    expect(@barracks.lumber).to eq(440)
  end

  it "does 2X damage against barracks" do
    @seige_engine.attack!(@barracks)
    expect(@barracks.health_points).to eq(400)
  end

  it "should not be able to attack units" do
    @unit = Unit.new(50, 10)
    expect(@seige_engine.attack!(@unit)).to eq("Seige engines cannot attack other units")
  end
end