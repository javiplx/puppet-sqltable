require "spec_helper"

describe Puppet::Type.type(:sqltable).provider(:sqltable) do

  before :each do
    @resource = Puppet::Type.type(:sqltable).new(
                     :name   => 'example.Configuration.thekey',
                     :ensure => :present ,
                     :key    => "thekey" ,
                     :value  => "thevalue"
                     :database => "example" ,
                     :description => "description of key"
                   )
    @provider = described_class.new( @resource )
  end

  [ :create,
    :destroy,
    :exists?
    ].each do |method|
    it "should respond to method #{method} called" do
      @provider.should respond_to(method)
    end
  end


end
