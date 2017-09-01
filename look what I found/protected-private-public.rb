# So what is the difference between Public, Private, Protected?

# example

class GoodDog
  DOG_YEARS = 7

  attr_accessor :name, :age

  def initialize(n, a)
    self.name = n
    self.age = a
  end

  def public_disclosure
    "#{self.name} in human years is #{human_years}"
  end

  def a_public_method
    "Will this work? " + self.a_protected_method
  end

  def older_in_cat_years_than(other)
    age_cat_years > other.age_cat_years # accessing other protected instance from same class
  end

  protected

  def age_cat_years
    age * 3

  end

  def a_protected_method
    "Yes, I'm protected!"
  end

  private

  def human_years
    age * DOG_YEARS
  end
end

=begin
Accessibility :

|| Anywhere ||

Public can be accessed from outside the class.

>> It is so 'out there in your face, do whatever you want with it'

|| Inside the class ||

Private can only be accessed from inside the class.

>> By using a public method that calls that private method (WITHOUT ANY RECEIVER prepended to it,
such as the object name or even self).

>> UNLESS.... calling a PRIVATE SETTER method. If you try to remove the receiver,
ruby will create a local variable. Self is a must in this case.

So, I'd like to imagine their interaction like between a deaf person with the interpreter.
They communicate with a sign language. People who can not speak in sign language,
must ask the interpreter in order to know what the deaf person wants to say.
Only through the interpreter (public method), user can communicate with the deaf
person (private method). And, the deaf person does not like to know your name,
so she does not need #self or object name prepended to the her (the private method.)

UNLESS.... the deaf person is going to SET your death sentence. In that case,
it has to know who is going to die by prepending #self to it.

>> Private can NOT be accessed from outside the class.

|| Anywhere but Outside Too ||

Protected is like Private :
- Can be accessed from outside the class through a public method ONLY.
- Can access another object from the same class.

But Protected may or may not use self. Private is more strict,
it can not be called on any receiver (unless it is a setter method).

Protected is like Public :
- Can be accessed inside the class with or without self

Bla bla bla... you're confused, are you? Protected sounds similar to Private.
Subtly, yes they do look similar.

But there is BIG DIFFERENCE.
It is on how they are treated on INHERITENCE.
Private methods can not be passed on to subclasses, but Protected can.

Boom shakalaka!!! You have mastered the understanding between P,P,P methods!!!
Why don't we just start calling all of them "P", so everyone who is trying to learn
will be even more confused. Jk.

I just hate when tutorials out there are not really honest on their limited understanding.
They gave a bunch of theories but not enough "why's". Maybe, they hoped that the less explanation,
the smarter and more sophisticated they seem :/
=end
