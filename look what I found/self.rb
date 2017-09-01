=begin
So, what is self in Ruby?
It has a few other explanation, but through the example below,
I will demonstrate, how self can be used to refer to the object itself.
That is by calling to_s when you put the variable on a string interpolation.

The module Walkable uses #{self} which refers to what is defined
in each of the classes' to_s method :

- the @name of Person instance
- the @name of Cat instance
- the @name of Cheetah instance
BUT ALSO!!!
- the @title and @name of Noble instance << notice that it has 2 variables

How does this work? The module has #walk method that uses #{self}
and #{self} == to_s in the case of string interpolation, e.g line 22;
or just do >> puts "I am #{self}" 


=end

module Walkable
  def walk
    "#{self} #{gait} forward"
  end
end

class Person
  attr_reader :name

  include Walkable

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  attr_reader :name

  include Walkable

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  attr_reader :name

  include Walkable

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end

  private

  def gait
    "runs"
  end
end

class Noble
  attr_reader :name, :title

  include Walkable

  def initialize(name, title)
    @title = title
    @name = name
  end

  def to_s
    "#{title} #{name}"
  end

  private

  def gait
    "struts"
  end
end
