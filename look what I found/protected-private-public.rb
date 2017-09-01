=begin
The difference will be on Visibility and how they are treated in the case of Inheritance :

Visibility :

|| Anywhere || Public can be accessed from inside and outside the class.

It is so 'out there in your face, use it whenever you want'

|| Inside the class || Both Private and Protected can only be accessed from inside the class.

The similarity between Protected and Private :

Both can be accessed from outside the class through a public method.
The differences between Protected and Private are :

Private method can not be called with a receiver (not even with self).
UNLESS ... calling a PRIVATE SETTER method. If you try to remove the receiver,
Ruby will create a local variable. Self is a must in this case.
Protected may or may not use self.
Protected can access another object's protected method that comes from the same class, Private can not.
When it comes to Inheritance :

Private methods can only be called on subclasses implicitly
(simply just the name of the method) but not explicitly (using #self).
Protected can be called both ways (with or without #self || implicitly or explicitly).

Example with code below :
=end

class Dog
  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a
  end

  def accessing_private
    "#{self.name} in human years is #{human_years}. This is secret!" # no receiver
  end

  def accessing_protected
    "Will this work? " + a_protected_method
  end

  def older_than(other) # accesing other object's protected method
    age_cat_years > other.age_cat_years # accessing other instance's protected method from the same class
  end

  def boy
    gender_method("boy") # accessing private setter method
  end

  protected

  def age_cat_years
    age * 3
  end

  def a_protected_method
    "Yes, I'm protected!"
  end

  private
