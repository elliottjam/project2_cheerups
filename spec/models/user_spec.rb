require 'spec_helper'

describe User do

  describe "relations" do
   it {should have_many(:cheer_ups)}
  end

end
