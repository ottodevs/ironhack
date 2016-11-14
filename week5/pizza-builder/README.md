Pizza Builder
=============

A browser JavaScript and DOM manipulation exercise.

Based on [css3pizza](http://codepen.io/dsmoore/full/fiwAl)
by [Derek S. Moore](http://dereksmoore.com).

We've got the munchies for a nice, fresh pie of pizza.
Of course, we want to order online.
After all, talking to a person will only delay the consumption of pizza.
There's only one problem: our local pizzeria's pizza builder **isn't working**.
This time,
the local pizzeria is in luck because their customer today is a Web developer.
We always hear about how developers should give back to their community.
I can't think of a more meaningful contribution
than helping the community get pizza more easily.

Taking a look at their pizza builder,
it seems like their JavaScript file, `pizza.js`, is empty.
They must have ran out of money before the developer delivered their JavaScript.
Let's help them out by writing the pizza builder's JavaScript.


Instructions
------------

### Iteration #1: Add and remove toppings ###

There are five buttons on the left of the pizza builder.
Three of those are supposed to add and remove toppings from the pizza.
Write the JavaScript necessary for those three buttons to **add and remove**
**pepperonni**, **mushrooms** and **green peppers** from the pizza.
**Don't worry about updating the price.**
We will do that later.

It appears that each individual topping has its own HTML element.
Here are examples of each of the toppings HTML.

```html
<!-- pepperonni -->
<section class="pep one">1</section>
<section class="pep two">2</section>

<!-- green peppers -->
<section class="green-pepper one"></section>
<section class="green-pepper two"></section>

<!-- mushrooms -->
<section class="mushroom one">
  <div class="cap">3</div>
  <div class="stem"></div>
</section>
<section class="mushroom two">
  <div class="cap">3</div>
  <div class="stem"></div>
</section>
```

How could you conceal and display those elements when the buttons are clicked?


### Iteration #2: Sauce and crust options ###

Wait a minute...
This pizza comes with white sauce and gluten-free crust by default!
Since that is a ridiculous default setting we need to fix this
as fast as possible.
The last two buttons on the left are supposed to handle
special options for the sauce and crust of your pizza.
Make it so **regular sauce** and **crust** are selected **by default**.
Also write the JavaScript code that will let users
**select white sauce** and **gluten-free crust** if they want to choose them.
Again, **don't worry about updating the price**.

It looks like both the crust and the sauce each have their own HTML elements.

```html
<section class="crust crust-gluten-free">
  <section class="cheese"></section>
  <section class="sauce sauce-white"></section>
</section>
```

Those `crust-gluten-free` and `sauce-white` classes look suspicious.
What happens if you remove those classes?


### Iteration #3: Change the buttons' state ###

Currently our pizza builder's buttons look the same,
no matter if the option is activated or not.
If you notice, all the buttons have an `active` class.

```html
<button class="btn btn-pepperonni active">Pepperonni</button>
```

It seems like that class is meant for only buttons who's ingredient is _on_.
If you remove that class, the buttons look different.
Write some JavaScript that will **remove and add**
the buttons' `active` class appropriately.
In other words, if the ingredient is turned on, its button should have `active`.
If the ingredient is off, remove the `active` class from the button.
Also make sure that the buttons' initial state matches that of their ingredient.
If when you first load the pizza builder there is no pepperonni,
the pepperonni button should not be active.


### Iteration #4: Update price ###

On the right of the pizza builder there is a price section.
It should show the current price of your pizza,
but it's always stuck on **$21**,
which is the price if all the ingredients were on.
Write the JavaScript that **update the current price** of the pizza
**as a user clicks** the ingredient buttons to turn ingredients on and off.

The element you will need to update is a `<strong>` tag.

```html
<!-- Price -->
<aside class="panel price">
  <!-- [...] -->

  <strong>$21</strong>
</aside>
<!-- End Price -->
```

How can you keep track of the current price?
When an ingredient changes, how will you know how much to add or subtract?

**Don't worry about the individual price items** in above the total.
First update the total price and worry about those later.


### Iteration #5: Update ingredient itemization ###

Now that the price is updating we should also **update the itemization**
of the ingredients that make up the total price.
It's always showing all of the ingredients, as if they were all turned on.
Use JavaScript to **hide and show the price items**
as they are turned on and off.
When an ingredient is on, the user should see the price of the item.
When an ingredient is off, the price item should be hidden.

For example if the user has selected only **white sauce** and **green peppers**,
they should see:

```
$10 cheese pizza
  + $1 green peppers
  + $3 white sauce
$14
```

When an ingredient changes, how will you know which element to hide?


### The Competing Pizza Builder ###

If you aren't sure how something should work,
you can try to reverse engineer
[the competition's pizza builder](https://khalifenizar.github.io/pizza-builder).
They had enough money to get their pizza builder's JavaScript,
but they don't deliver to Ironhack.
Screw _that_ pizzeria!

Anyway the URL is: https://khalifenizar.github.io/pizza-builder.


License
-------

ISC © [Nizar Khalife Iglesias](https://twitter.com/khalifenizar)
