=begin
A public method is a method that is available to anyone who knows either
the class name or the object’s name. In other words, a public method can be accessed
from both inside and outside the class.

Meanwhile, private and protected methods are not accessible from outside the class.
The only way to access them is through a public method.

The difference between these access controls will be on Visibility and
how they are affected by Inheritance  :

Let’s talk about Visibility
Who gets to talk to everyone in public? It is the one and only, Public method.

Who can't communicate with the world directly? Sadly, it is Private and
Protected methods (wait, no, it is not sad, we need them to be like that).

Public method is pretty straight forward. I have noticed a lot of people grasped
the concept easily, but some struggle (honestly, myself included) with the other two methods,
Private and Protected.

So, now let’s focus on Private and Protected and how are they similar and different to each other.

The similarity between Protected and Private :

– Both can be accessed from outside the class through a public method.

The differences between Protected and Private are :

– Private method can not be called with a receiver (not even with #self).
Unless … calling a Private setter method. If you try to remove the receiver, Ruby will create a local variable. Self is necessary in this case.

– Protected may or may not use a receiver such as #self.

– Protected can access another object’s protected method that comes from the same class, Private can not.

=end

class Dog
  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a
  end

  def accessing_private
    "#{self.name} in human years is #{human_years}. This is secret!"
  end

  def accessing_protected
    "Will this work? " + a_protected_method
  end

  def eat_more_than(other)
  # accessing other instance's protected ﻿method from the same class
    daily_diet < other.daily_diet
    "#{name} eats more than #{other.name}"
  end

  def boy
    gender_method("boy") # accessing private setter method
  end

  protected

  def daily_diet
    age * 2 # the younger, the more they have to eat
  end

  def a_protected_method
    "Yes, I'm protected!"
  end

  private

  attr_writer :gender

  def gender_method(gender)
    self.gender = gender # private setter method requires self
    "#{name} is a #{gender}"
  end

  def human_years
    age * 8
  end
end

# Create the first object of Dog
blake = Dog.new("Blake", 5)

p blake.accessing_private # "Blake in human years is 16. This is secret!"

p blake.accessing_protected # "Will this work? Yes, I'm protected!"

# Create the second object of Dog
jackson = Dog.new("Jackson", 1)

# Below, protected methods from different objects of the same type/class
# ﻿are proven to share access
p jackson.eat_more_than(blake) # true -> "Jackson eats more than Blake"

# Below, accessing private setter method through a public method.
p blake.boy # Blake is a boy

=begin
Let's talk about Inheritance
In Ruby, the inheritance hierarchy does not really enter into the equation. It is rather all about 'the receiver'.

– Private methods can only be called on subclasses implicitly (only call the name of the method) but not explicitly (using #self).

– Protected can be called both ways (with or without #self || implicitly or explicitly).

Example with code below :
=end

class Puppy < Dog

  def accessing_protected_explicitly
    "Explicitly calls '#{self.a_protected_method}'"
  end

  def accessing_protected_implicitly
    "Call protected method implicitly '#{a_protected_method}'"
  end

  def accessing_private_implicitly
    "#{self.name} is #{human_years} years old in human years. This is a secret!"
  end

  def accessing_private_explicitly
    "#{self.name} is #{self.human_years} years old in human years" # error
  end
end

# Below, testing them on a subclass
booboo = Puppy.new("Booboo", 1 )
p booboo.accessing_protected_explicitly # works
p booboo.accessing_protected_implicitly # works
p booboo.accessing_private_implicitly # works
p booboo.accessing_private_explicitly # error, called on a receiver

=begin
The bottom line is that we can always call a private method implicitly from within a class
it is declared in, as well as all subclasses of this class. While a protected method can be called either way.

Well, that's all my short explanation on Ruby access controls. Feel free to also visit my portfolio at www.mayanovarini.com

Thanks for reading :)
=end
