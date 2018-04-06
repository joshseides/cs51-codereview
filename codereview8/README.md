# Code Review 8 Handout
## Josh Seides

### Topic Outline
This week we look at another interesting paradigm: object-oriented programming.

* introduction
* methods and classes
* inheritance and overriding
* interfaces
* dynamic dispatching

### Why Object-Oriented Programming?

The main reason why OOP is so powerful is it eliminates a lot of extraneous coding that programmers have to do to handle many different objects at once. OOP allows you to define methods that work with generic objects instead of worrying about the details of any particular object. In addition, you don’t have to re-type a lot of code that you might have to otherwise, to define new objects.

### Methods and Classes

#### Methods (Ezra)

An object is something that has data stored in fields (frequently called **instance variables**) and has **methods**: functions that can be called on the object and can interact with the data in the object's fields. Invoking an object's method is often thought of as "sending a message" to the object. Fields can be mutable or immutable. Methods are able to read both sorts of fields but can only modify mutable fields. Methods are similar to regular functions, with the notable exception that methods are allowed to take zero arguments (you might think of the object on which the method is invoked as always being an implicit argument).

#### Classes

Because of the focus on objects, OOP makes use of an abstraction called a **class**. A class encapsulates the properties and functions an object may use. For example, if you wanted to abstract the idea of a student, you might write a class that contained properties like "house," "concentration," or "favorite food." In addition, your class might contain methods like "eatFavoriteFood" or "doHomework."

This is in contrast to functional programming, where functions take objects as parameters! In OOP, these functions are part of the class definition, and are available for any instance of the class.

Classes generally provide additional methods called constructors that take a few parameters and return a new instance of the class. For example, using the above example, one constructor for a student might take three parameters ("house," "concentration," and "favorite food").

You might find thinking of classes this way helpful: functors return new modules in much the same way that constructors return new class instances. Functions contained in a module are similar to methods contained in a class (although class methods usually do not require the object as a parameter, like module functions do). A class definition is similar to module signatures in that the class definition is not an object itself; it merely provides a template for concrete objects to conform to.

#### Problem 1
*Define a class `student`. What values and methods should `student`?*

#### Problem 2
*Implement a function `getAverage` that takes as input a `student list` and returns a `float` denoting the average GPA of all the students in the input list. Assume `student` has a method `getGPA` that returns a student's GPA.*

### Inheritance and Overriding

Objects can often be thought of in a hierarchical fashion; for example, a student can be either a graduate or an undergraduate. Undergraduates can be further divided into STEM concentrators, humanities concentrators, and more.

With other programming paradigms, you might have trouble defining the concept of a STEM concentrator in code; you would probably have to paste all the code you used to define a generic student into your definition for a STEM concentrator. To solve this problem, OOP makes use of a concept called inheritance. The idea is that STEM concentrators should probably have all the same properties and methods that generic students do; in OOP, we say that STEM concentrators inherit from generic students.

Specifically, we say that a STEM concentrator class is a subclass of a generic student class. This makes defining lots of objects in a hierarchy a lot easier!

#### Problem 3
*Define a class `STEMbro` that inherits from `student` and adds the appropriate values and methods (if any) for STEM bros.*

To allow for the possibility of defining more specific behavior for subclasses, OOP allows subclasses to override methods (and occasionally properties) of their superclasses.

#### Problem 4
*Update the `STEMbro` class to override the `getGPA` method to subtract `0.5` from the value returned by the `getGPA` implementation of `student`.*

#### Problem 5
*Create a `STEMbro list` of your three favorite STEM bros.*

#### Problem 6
*Pass your `STEMbro list` to `getAverage`. What happens here? How can this be fixed?*

### Interfaces

**Interfaces** are similar to module signatures; they specify what methods concrete classes should have available for use (although they provide no information about implementation details). Classes can signal that they conform to a particular interface, and functions can make use of this fact to use the methods that they now know are available for use.

Also similarly to module signatures, interfaces allow you to expose only as much information as you would like about a class. This allows you to define internal functions in a class that the “outside world” cannot use.

#### Problem 7
*Define a class type `person` and make the previously defined `student` class to be of type `person`. What parameters, values, and methods should `person` have?*

### Dynamic Dispatching

In OOP, methods are looked up at runtime for their specific implementation; this means that even if a function is passed a shape object, the exact implementation of the area method isn’t known until it’s called. This is what enables programmers to pass any concrete shape class and have the correct methods be used at runtime. In addition, methods can call upon each other at compilation time, instead of having to be defined recursively (remember how you had to define `'a stream` and a `str` at the same time in Lab 6?). For this reason, OOP is **dynamic**; there’s a lot of flexibility in how your methods are defined!

### Important Concepts and Operators to Remember

* `:>`
* `?`
* `!method`

### Ezra's Disadvantages to Using OOP

* OOP encourage mutable state. Hopefully, we’ve at least partly convinced you that global and mutable state should be considered harmful. It’s much easier to reason about (and rigorously prove properties of) programs that have no (or very little) mutable state. Thinking about programming in terms of objects which own and mutate their own data is an inherently imperative, mutable way of thinking.
* OOP encourages complicated hierarchies. Inheritance in classes makes it convenient to define large, branching hierarchies of classes that is difficult to modify. While this is sometimes a natural way to break down a problem, I would contend that most problems that arise in practice are not well-modeled by inheritance relationships.
